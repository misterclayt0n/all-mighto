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

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    dsearch = {
      url = "github:AvengeMedia/danksearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-cli = {
      url = "github:AvengeMedia/danklinux";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
      inputs.dms-cli.follows = "dms-cli";
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
        inputs.home-manager.nixosModules.home-manager
        # inputs.niri.nixosModules.niri
        {
          home-manager.useGlobalPkgs   = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";

          home-manager.sharedModules = [
            inputs.zen-browser.homeModules.twilight
          ];

          home-manager.users.mister = { ... }: {
            imports = [
              inputs.niri.homeModules.niri
              inputs.dankMaterialShell.homeModules.dankMaterialShell.default
              inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
              inputs.dsearch.homeModules.default
            ];

            # programs.niri.enable = true;
            programs.dankMaterialShell = {              
              enable = true;
              # niri = {
                # enableKeybinds = true;  # Automatic keybinding configuration
                # enableSpawn = true;
              # };
            };

            programs.dsearch.enable = true;

            home.stateVersion = "24.11";
          };
        }
      ];
    };
  };
}
