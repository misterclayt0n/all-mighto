{ config, pkgs, lib, ... }:

{
	home.packages = with pkgs; [
    gcc
		gnumake
		clang-tools
	];
}
