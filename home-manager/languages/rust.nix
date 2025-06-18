{ config, pkgs, lib, ... }:

{
	home.packages = with pkgs; [
		rustc
		rustfmt
		clippy
		cargo
		rust-analyzer
		cargo-expand
	];
}
