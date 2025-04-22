{ config, pkgs, system, inputs, ... }:

{
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

		# Nix related.
		nix-output-monitor # It provides the command `nom` works just like `nix` with more details log output.
		inputs.zen-browser.packages."${system}".default

	];

	# TODO: Git.
	# programs.git = {
	# 	enable = true;
	# 	userName = "Ryan Yin";
	# 	userEmail = "xiaoyin_c@qq.com";
	# };

	# This value determines the home Manager release that your
	# configuration is compatible with. This helps avoid breakage
	# when a new home Manager release introduces backwards
	# incompatible changes.
	#
	# You can update home Manager without changing this value. See
	# the home Manager release notes for a list of state version
	# changes in each release.
	home.stateVersion = "24.11";

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

	xdg.configFile = {
	    # This writes ~/.config/jj/config.toml from the jujutsu.toml file.
	    "jj/config.toml".source = ./jujutsu.toml;
	};
}
