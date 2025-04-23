{ config, pkgs, system, inputs, ... }:

{
	imports = [
		./languages/rust.nix
		./languages/go.nix
	];

	home.username = "mister";
	home.homeDirectory = "/home/mister";

	# Packages that should be installed to the user profile.
	home.packages = with pkgs; [
		neofetch # Nix btw
		fastfetch
		zip
		tree
		jujutsu
		gh
		ghostty
		nushell
		zoxide
		vesktop # Discord client.
		delta # Pager (like less).
		ani-cli
		starship

		# Nix related.
		nix-output-monitor # It provides the command `nom` works just like `nix` with more details log output.
		inputs.zen-browser.packages."${system}".default
	];

	# Generate zoxide script for nushell.
	xdg.configFile."nushell/zoxide.nu".source =
		pkgs.runCommand "zoxide.nu" {} ''
		${pkgs.zoxide}/bin/zoxide init nushell --cmd cd > $out
		'';                 
	
	# Generate starship script for nushell.
	xdg.configFile."nushell/starship.nu".source =
		pkgs.runCommand "starship.nu" {} ''
		${pkgs.starship}/bin/starship init nu > $out
		'';

	home.stateVersion = "24.11";

	xdg.enable = true;
	# Let home Manager install and manage itself.
	programs.home-manager.enable = true;

	# 
	# Programs setup.
	#

	# Git.
	programs.git = {
		enable = true;
		package = pkgs.gitFull; #GUI and SSH support.
		userName = "misterclayt0n";
		userEmail = "daviarantes13@gmail.com";
		extraConfig.init.defaultBranch = "main";
	};

	# Nushell.
	programs.nushell = {
		enable = true;
		package = pkgs.nushell;
		envFile.source    = ./nushell/env.nu;
		configFile.source = ./nushell/config.nu;
	};

	xdg.configFile = {
	    # This writes ~/.config/jj/config.toml from the jujutsu.toml file.
	    "jj/config.toml".source = ./jujutsu.toml;
	    "ghostty/config".text = builtins.readFile ./ghostty.linux;

	    # Helix.
	    "helix/config.toml".source = ./helix/config.toml;
	    "helix/languages.toml".source = ./helix/languages.toml;
	    "helix/themes".source = ./helix/themes;

			# Starship.
			"starship.toml".source = ./starship.toml;
	};
}
