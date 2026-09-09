{-# OPTIONS_GHC -Wno-missing-signatures #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module PandocBridge
  ( pandocBridgeMarkdownToAst
  , pandocBridgeAstToHtml
  , pandocBridgeFree
  ) where

import Data.Aeson ((.:?), (.!=))
import qualified Data.Aeson as A
import qualified Data.Aeson.Key as K
import qualified Data.Aeson.KeyMap as KM
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as BL
import Data.Maybe (fromJust)
import Data.MessagePack (Object (..))
import qualified Data.MessagePack as MP
import qualified Data.Scientific as Sci
import qualified Data.Text as T
import qualified Data.Text.Encoding as TE
import qualified Data.Vector as V
import Data.Word (Word8)
import Foreign.C.Types (CSize (..))
import Foreign.Marshal.Alloc (free, mallocBytes)
import Foreign.Marshal.Utils (copyBytes)
import Foreign.Ptr (Ptr, castPtr)
import Foreign.Storable (poke)
import Text.Pandoc
import Text.Pandoc.CrossRef
import Text.Pandoc.Format
  ( applyExtensionsDiff
  , formatName
  , getExtensionsConfig
  , parseFlavoredFormat
  )
import Text.Pandoc.Readers.Markdown (yamlToMeta)

data BridgeOptions = BridgeOptions
  { boFrom         :: T.Text
  , boColumns      :: Int
  , boTabStop      :: Int
  , boCrossrefYaml :: Maybe T.Text
  } deriving (Show)

defaultBridgeOptions :: BridgeOptions
defaultBridgeOptions = BridgeOptions
  { boFrom         = "markdown"
  , boColumns      = 10000
  , boTabStop      = 4
  , boCrossrefYaml = Nothing
  }

instance A.FromJSON BridgeOptions where
  parseJSON = A.withObject "BridgeOptions" $ \o ->
    BridgeOptions
      <$> o .:? "from" .!= boFrom defaultBridgeOptions
      <*> o .:? "columns" .!= boColumns defaultBridgeOptions
      <*> o .:? "tab_stop" .!= boTabStop defaultBridgeOptions
      <*> o .:? "crossref_yaml"

valueToObject :: A.Value -> Object
valueToObject = \case
  A.Null -> ObjectNil
  A.Bool b -> ObjectBool b
  A.Number n ->
    case Sci.floatingOrInteger n :: Either Double Integer of
      Left d -> ObjectDouble d
      Right i -> ObjectInt (fromIntegral i)
  A.String t -> ObjectStr t
  A.Array values -> ObjectArray (V.map valueToObject values)
  A.Object object ->
    ObjectMap . V.fromList
      $ [ (ObjectStr (K.toText key), valueToObject value)
        | (key, value) <- KM.toList object
        ]

objectToValue :: Object -> A.Value
objectToValue = \case
  ObjectNil -> A.Null
  ObjectBool b -> A.Bool b
  ObjectInt i -> A.Number (fromIntegral i)
  ObjectFloat f -> A.Number (realToFrac f)
  ObjectDouble d -> A.Number (realToFrac d)
  ObjectStr t -> A.String t
  ObjectBin bytes -> A.String (TE.decodeUtf8 bytes)
  ObjectArray values -> A.Array (V.map objectToValue values)
  ObjectMap entries ->
    A.Object (KM.fromList [(objectKey key, objectToValue value) | (key, value) <- V.toList entries])
  ObjectExt _ _ -> error "unsupported MessagePack extension"

objectKey :: Object -> K.Key
objectKey (ObjectStr text) = K.fromText text
objectKey _ = error "MessagePack object key is not a string"

packPandoc :: Pandoc -> BS.ByteString
packPandoc = BL.toStrict . MP.pack . valueToObject . A.toJSON

unpackPandoc :: BS.ByteString -> Pandoc
unpackPandoc bytes =
  case A.fromJSON (objectToValue (fromJust (MP.unpack (BL.fromStrict bytes) :: Maybe Object))) of
    A.Success pandoc -> pandoc
    A.Error err -> error err

decodeBridgeOptions :: BS.ByteString -> BridgeOptions
decodeBridgeOptions bytes
  | BS.null bytes = defaultBridgeOptions
  | otherwise =
      case A.fromJSON (objectToValue (fromJust (MP.unpack (BL.fromStrict bytes) :: Maybe Object))) of
        A.Success options -> options
        A.Error err -> error err

markdownToAst :: BS.ByteString -> BridgeOptions -> BS.ByteString
markdownToAst markdown BridgeOptions{..} =
  packPandoc $ runCrossRef metadata (Just (Format "html5")) defaultCrossRefAction document
  where
    markdownText = TE.decodeUtf8 markdown
    extensions = either (error . show) id $ runPure $ do
      flavored <- parseFlavoredFormat boFrom
      applyExtensionsDiff (getExtensionsConfig (formatName flavored)) flavored
    readerOptions =
      def
        { readerExtensions = extensions
        , readerColumns = boColumns
        , readerTabStop = boTabStop
        }
    document = either (error . show) id $ runPure (readMarkdown readerOptions markdownText)
    metadata = maybe mempty parseCrossref boCrossrefYaml
    parseCrossref yaml =
      either (error . show) id $
        runPure
          ( yamlToMeta
              (def { readerExtensions = pandocExtensions })
              (Just "crossref")
              (TE.encodeUtf8 yaml)
          )

astToHtml :: BS.ByteString -> BridgeOptions -> BS.ByteString
astToHtml bytes BridgeOptions{..} =
  TE.encodeUtf8 $ either (error . show) id $ runPure (writeHtml5String writerOptions document)
  where
    document = unpackPandoc bytes
    writerOptions =
      def
        { writerColumns = boColumns
        , writerTabStop = boTabStop
        , writerWrapText = WrapAuto
        , writerHighlightMethod = NoHighlighting
        , writerTemplate = Nothing
        }

readInput :: Ptr Word8 -> CSize -> IO BS.ByteString
readInput ptr len = BS.packCStringLen (castPtr ptr, fromIntegral len)

writeOutput :: Ptr (Ptr Word8) -> Ptr CSize -> BS.ByteString -> IO ()
writeOutput outPtr outLen bytes = do
  let size = BS.length bytes
  buffer <- mallocBytes (max 1 size)
  BS.useAsCStringLen bytes $ \(source, _) ->
    copyBytes buffer (castPtr source) size
  poke outPtr buffer
  poke outLen (fromIntegral size)

foreign export ccall "pandocBridgeMarkdownToAst"
  pandocBridgeMarkdownToAst
    :: Ptr Word8
    -> CSize
    -> Ptr Word8
    -> CSize
    -> Ptr (Ptr Word8)
    -> Ptr CSize
    -> IO ()

pandocBridgeMarkdownToAst
  :: Ptr Word8
  -> CSize
  -> Ptr Word8
  -> CSize
  -> Ptr (Ptr Word8)
  -> Ptr CSize
  -> IO ()
pandocBridgeMarkdownToAst markdownPtr markdownLen optionsPtr optionsLen outPtr outLen = do
  markdown <- readInput markdownPtr markdownLen
  optionsBytes <- readInput optionsPtr optionsLen
  writeOutput outPtr outLen (markdownToAst markdown (decodeBridgeOptions optionsBytes))

foreign export ccall "pandocBridgeAstToHtml"
  pandocBridgeAstToHtml
    :: Ptr Word8
    -> CSize
    -> Ptr Word8
    -> CSize
    -> Ptr (Ptr Word8)
    -> Ptr CSize
    -> IO ()

pandocBridgeAstToHtml
  :: Ptr Word8
  -> CSize
  -> Ptr Word8
  -> CSize
  -> Ptr (Ptr Word8)
  -> Ptr CSize
  -> IO ()
pandocBridgeAstToHtml astPtr astLen optionsPtr optionsLen outPtr outLen = do
  ast <- readInput astPtr astLen
  optionsBytes <- readInput optionsPtr optionsLen
  writeOutput outPtr outLen (astToHtml ast (decodeBridgeOptions optionsBytes))

foreign export ccall "pandocBridgeFree"
  pandocBridgeFree :: Ptr Word8 -> IO ()
pandocBridgeFree ptr = free ptr
