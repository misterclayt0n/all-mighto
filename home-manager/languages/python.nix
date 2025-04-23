{ config, pkgs, lib, ... }:

{
	home.packages = with pkgs; [
    python3
    ruff
    python312Packages.python-lsp-server
    python312Packages.python-lsp-ruff
	];
}
