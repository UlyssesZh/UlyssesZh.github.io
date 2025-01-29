{ pkgs ? import <nixpkgs> {} }: with pkgs; mkShell {
	packages = [
		ruby_3_2
		haskellPackages.pandoc-cli
		haskellPackages.pandoc-crossref
		pandoc-katex
	];
}
