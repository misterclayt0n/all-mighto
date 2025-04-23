
{ config, pkgs, lib, ... }:

{
	home.packages = with pkgs; [
    odin
    ols
	];
}
