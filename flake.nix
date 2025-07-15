{
	description = "All might";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/master";
			# The `follows` keyword in inputs is used for inheritance.
			# Here, `inputs.nixpkgs` of home-manager is kept consistent with
			# the `inputs.nixpkgs` of the current flake,
			# to avoid problems caused by different versions of nixpkgs.
			inputs.nixpkgs.follows = "nixpkgs";
		};
		zen-browser = {
			url = "github:youwen5/zen-browser-flake"; # The nice version of zen flake.
			inputs.nixpkgs.follows = "nixpkgs"; 
		};
    nvf = {
			url = "github:notashelf/nvf";
			inputs.nixpkgs.follows = "nixpkgs"; 
		};
		niri = {
			url = "github:sodiboo/niri-flake";
			inputs.nixpkgs.follows = "nixpkgs"; 
		};
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		# Temp stuff don't think about it too much
    helix-master.url = "github:helix-editor/helix/master";
    helix-master.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = inputs@{ nixpkgs, home-manager, zen-browser, nvf, niri, quickshell, helix-master, ... }: {
		nixosConfigurations = {
			nixos = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./nixos/configuration.nix
						# Make home-manager as a module of nixos so that home-manager
						# configuration will be deployed automatically when executing `nixos-rebuild switch`
						home-manager.nixosModules.home-manager
						{
							home-manager.useGlobalPkgs = true;
							home-manager.useUserPackages = true;

							home-manager.users.mister = import ./home-manager/home.nix;
							home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
						}
				];
			};
		};
	};
}
