{ pkgs ? import <nixpkgs> {} }: with pkgs; mkShell {
	packages = [
		haskellPackages.pandoc-cli
		haskellPackages.pandoc-crossref
		pandoc-katex
	];
}
