{-# OPTIONS_GHC -Wno-missing-signatures #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module PandocBridge
  ( pandocBridgeInit
  , pandocBridgeMarkdownToAst
  , pandocBridgeAstToHtml
  , pandocBridgeFree
  ) where

import Control.Concurrent.MVar (MVar, newEmptyMVar, readMVar, tryPutMVar)
import Data.Aeson ((.:))
import qualified Data.Aeson as A
import qualified Data.Aeson.Key as K
import qualified Data.Aeson.KeyMap as KM
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy as BL
import qualified Data.Map as M
import Data.Maybe (fromJust, fromMaybe)
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
import System.IO.Unsafe (unsafePerformIO)
import Text.Pandoc
import Text.Pandoc.App (Opt (..))
import Text.Pandoc.CrossRef
import Text.Pandoc.Format
  ( applyExtensionsDiff
  , formatName
  , getExtensionsConfig
  , parseFlavoredFormat
  )
import Text.Pandoc.Highlighting (lookupHighlightingStyle)
import Text.Pandoc.Shared (blocksToInlines, tabFilter)

data BridgeOptions = BridgeOptions
  { boPandoc   :: Opt
  , boCrossref :: A.Value
  }

data BridgeConfig = BridgeConfig
  { bcReaderOptions :: ReaderOptions
  , bcWriterOptions :: WriterOptions
  , bcCrossrefMeta  :: Meta
  , bcFormat        :: Format
  , bcPreserveTabs  :: Bool
  , bcTabStop       :: Int
  }

instance A.FromJSON BridgeOptions where
  parseJSON = A.withObject "BridgeOptions" $ \o ->
    BridgeOptions
      <$> o .: "pandoc"
      <*> o .: "crossref"

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
decodeBridgeOptions bytes =
  case A.fromJSON (objectToValue (fromJust (MP.unpack (BL.fromStrict bytes) :: Maybe Object))) of
    A.Success options -> options
    A.Error err -> error err

metaFromValue :: A.Value -> Meta
metaFromValue (A.Object object) =
  Meta (M.fromList [(K.toText key, metaValueFromValue value) | (key, value) <- KM.toList object])
metaFromValue _ = error "pandoc-crossref options must be an object"

metaValueFromValue :: A.Value -> MetaValue
metaValueFromValue = \case
  A.Null -> MetaString ""
  A.Bool b -> MetaBool b
  A.Number n -> MetaString (T.pack (show n))
  A.String t -> MetaInlines (markdownInlines t)
  A.Array values -> MetaList (V.toList (V.map metaValueFromValue values))
  A.Object object ->
    MetaMap (M.fromList [(K.toText key, metaValueFromValue value) | (key, value) <- KM.toList object])

markdownInlines :: T.Text -> [Inline]
markdownInlines text =
  case runPure (readMarkdown (def { readerExtensions = pandocExtensions }) text) of
    Right (Pandoc _ blocks) -> blocksToInlines blocks
    Left err -> error (show err)

buildConfig :: BridgeOptions -> BridgeConfig
buildConfig BridgeOptions{..} =
  BridgeConfig
    { bcReaderOptions = readerOptionsFromOpt boPandoc
    , bcWriterOptions = writerOptionsFromOpt boPandoc
    , bcCrossrefMeta = metaFromValue boCrossref
    , bcFormat = Format (fromMaybe "html5" (optTo boPandoc))
    , bcPreserveTabs = optPreserveTabs boPandoc
    , bcTabStop = optTabStop boPandoc
    }

extensionsFromSpec :: T.Text -> Extensions
extensionsFromSpec spec =
  either (error . show) id $ runPure $ do
    flavored <- parseFlavoredFormat spec
    applyExtensionsDiff (getExtensionsConfig (formatName flavored)) flavored

readerOptionsFromOpt :: Opt -> ReaderOptions
readerOptionsFromOpt opt =
  def
    { readerExtensions = extensionsFromSpec $ fromMaybe "markdown" (optFrom opt)
    , readerStandalone = optStandalone opt
    , readerColumns = optColumns opt
    , readerTabStop = optTabStop opt
    , readerIndentedCodeClasses = optIndentedCodeClasses opt
    , readerDefaultImageExtension = optDefaultImageExtension opt
    , readerTrackChanges = optTrackChanges opt
    , readerStripComments = optStripComments opt
    }

writerOptionsFromOpt :: Opt -> WriterOptions
writerOptionsFromOpt opt =
  def
    { writerTemplate = Nothing
    , writerTabStop = optTabStop opt
    , writerTableOfContents = optTableOfContents opt
    , writerListOfFigures = optListOfFigures opt
    , writerListOfTables = optListOfTables opt
    , writerIncremental = optIncremental opt
    , writerHTMLMathMethod = optHTMLMathMethod opt
    , writerNumberSections = optNumberSections opt
    , writerNumberOffset = optNumberOffset opt
    , writerSectionDivs = optSectionDivs opt
    , writerReferenceLinks = optReferenceLinks opt
    , writerDpi = optDpi opt
    , writerWrapText = optWrap opt
    , writerColumns = optColumns opt
    , writerEmailObfuscation = optEmailObfuscation opt
    , writerIdentifierPrefix = optIdentifierPrefix opt
    , writerSlideLevel = optSlideLevel opt
    , writerTopLevelDivision = optTopLevelDivision opt
    , writerHighlightMethod = highlightMethod $ optSyntaxHighlighting opt
    , writerHtmlQTags = optHtmlQTags opt
    , writerReferenceLocation = optReferenceLocation opt
    , writerFigureCaptionPosition = optFigureCaptionPosition opt
    , writerTableCaptionPosition = optTableCaptionPosition opt
    , writerPreferAscii = optAscii opt
    , writerLinkImages = optLinkImages opt
    }

highlightMethod :: T.Text -> HighlightMethod
highlightMethod style = case style of
  "none" -> NoHighlighting
  "default" -> DefaultHighlighting
  "idiomatic" -> IdiomaticHighlighting
  _ -> Skylighting (either (error . show) id $ runPure (lookupHighlightingStyle $ T.unpack style))

markdownToAst :: BS.ByteString -> BridgeConfig -> BS.ByteString
markdownToAst markdown BridgeConfig{..} =
  packPandoc $ runCrossRef bcCrossrefMeta (Just bcFormat) defaultCrossRefAction document
  where
    markdownText = tabFilter (if bcPreserveTabs then 0 else bcTabStop) (TE.decodeUtf8 markdown)
    document = either (error . show) id $ runPure (readMarkdown bcReaderOptions markdownText)

astToHtml :: BS.ByteString -> BridgeConfig -> BS.ByteString
astToHtml bytes BridgeConfig{..} =
  TE.encodeUtf8 $ either (error . show) id $ runPure (writeHtml5String bcWriterOptions document)
  where
    document = unpackPandoc bytes

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

{-# NOINLINE bridgeConfig #-}
bridgeConfig :: MVar BridgeConfig
bridgeConfig = unsafePerformIO newEmptyMVar

foreign export ccall "pandocBridgeInit"
  pandocBridgeInit :: Ptr Word8 -> CSize -> IO ()
pandocBridgeInit optionsPtr optionsLen = do
  optionsBytes <- readInput optionsPtr optionsLen
  _ <- tryPutMVar bridgeConfig (buildConfig (decodeBridgeOptions optionsBytes))
  pure ()

foreign export ccall "pandocBridgeMarkdownToAst"
  pandocBridgeMarkdownToAst
    :: Ptr Word8
    -> CSize
    -> Ptr (Ptr Word8)
    -> Ptr CSize
    -> IO ()
pandocBridgeMarkdownToAst markdownPtr markdownLen outPtr outLen = do
  markdown <- readInput markdownPtr markdownLen
  config <- readMVar bridgeConfig
  writeOutput outPtr outLen (markdownToAst markdown config)

foreign export ccall "pandocBridgeAstToHtml"
  pandocBridgeAstToHtml
    :: Ptr Word8
    -> CSize
    -> Ptr (Ptr Word8)
    -> Ptr CSize
    -> IO ()
pandocBridgeAstToHtml astPtr astLen outPtr outLen = do
  ast <- readInput astPtr astLen
  config <- readMVar bridgeConfig
  writeOutput outPtr outLen (astToHtml ast config)

foreign export ccall "pandocBridgeFree"
  pandocBridgeFree :: Ptr Word8 -> IO ()
pandocBridgeFree ptr = free ptr
