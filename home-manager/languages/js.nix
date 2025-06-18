{ config, pkgs, lib, ... }:

{
	home.packages = with pkgs; [
    # nodejs_23
    nodejs_latest
    bun
    typescript
    typescript-language-server
    yarn
    # deno
		pnpm
	];
}
