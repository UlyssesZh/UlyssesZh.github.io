{ pkgs ? import <nixpkgs> {} }: with pkgs; mkShell {
  packages = [
    ruby_4_0
    ghc
    cabal-install
    nodejs_26
  ];
  buildInputs = [
    zlib
  ];
}
