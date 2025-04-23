{ config, pkgs, lib, ... }:

{
	home.packages = with pkgs; [
    go
    gopls
    golangci-lint
    golangci-lint-langserver
	];
}
