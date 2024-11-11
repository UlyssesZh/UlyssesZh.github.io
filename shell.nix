{ pkgs ? import <nixpkgs> {} }: with pkgs; mkShell {
	packages = [
		ruby_3_2
		haskellPackages.pandoc-cli # NixOS/nixpkgs#348028
		(haskellPackages.pandoc-crossref.overrideAttrs (old: {
			version = "0.3.18.0";
			sha256 = "01kj17rf53kshfw7dd1875xi6s43b84hr7dvbfbhsb1c10pvdwac";
			revision = "1";
			editedCabalFile = "014brzc3r46b93hi4wzlyx9qf9qcf1js5qvpwk5rvzqpvazjglkj";
		}))
		pandoc-katex
	];
}
