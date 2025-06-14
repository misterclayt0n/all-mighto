{ config, pkgs, lib, ... }:

{
	home.packages = with pkgs; [
    # nodejs_23
    bun
    typescript
    typescript-language-server
    yarn
    # deno
		pnpm
	];
}
