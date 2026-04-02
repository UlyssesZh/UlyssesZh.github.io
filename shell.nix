{ pkgs ? import <nixpkgs> {} }: with pkgs; mkShell {
	packages = [
		ruby_4_0
		haskellPackages.pandoc-cli
		haskellPackages.pandoc-crossref
		pandoc-katex
	];
}
