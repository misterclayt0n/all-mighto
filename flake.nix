{
  description = "Mister's private NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";

      inputs.nixpkgs.follows      = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

   fenix = {
      url = "github:nix-community/fenix";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    dank-material-shell = {
      url = "github:AvengeMedia/DankMaterialShell";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, zen-browser, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.mister = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = { inherit inputs; };

      modules = [
        ./hosts/mister/default.nix
        inputs.niri.nixosModules.niri
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs   = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";

          home-manager.sharedModules = [
            inputs.zen-browser.homeModules.twilight
          ];

          home-manager.users.mister = { pkgs, ... }: {
            imports = [
              inputs.dank-material-shell.homeModules.dankMaterialShell.default
              inputs.dank-material-shell.homeModules.dankMaterialShell.niri
            ];

            programs.dankMaterialShell = {
              enable = true;
              enableSystemd = true;
            };

            services.network-manager-applet.enable = true;

            home.stateVersion = "24.11";
          };
        }
      ];
    };
  };
}
