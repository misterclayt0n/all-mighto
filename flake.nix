{
  description = "Mister's private NixOS configuration";

  nixConfig = {
    extra-substituters = "https://niri.cachix.org";
    extra-trusted-public-keys = "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964=";
  };

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

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };

    niri = {
      url = "github:sodiboo/niri-flake";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    the-editor.url = "github:misterclayt0n/the-editor";
    
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, the-editor, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.mister = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = { inherit inputs; };

      modules = [
        ./hosts/mister/default.nix
        inputs.home-manager.nixosModules.home-manager
        inputs.dankMaterialShell.nixosModules.greeter
        inputs.niri.nixosModules.niri
        ({ pkgs, ... }: {
          nixpkgs.overlays = [
            inputs.niri.overlays.niri
            (final: prev: {
              quickshell = inputs.quickshell.packages.${system}.default;
            })
          ];

          home-manager.useGlobalPkgs   = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";

          home-manager.sharedModules = [
            inputs.zen-browser.homeModules.twilight
          ];

          home-manager.users.mister = { ... }: {
            imports = [
              inputs.dankMaterialShell.homeModules.dankMaterialShell.default
              inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
              inputs.dsearch.homeModules.default
            ];

            programs.dankMaterialShell = {              
              enable = true;
            };

            programs.dsearch.enable = true;

            home.packages = [
              the-editor.packages.${system}.default
              inputs.quickshell.packages.${system}.default
            ];
            home.stateVersion = "24.11"; 
          };

          programs.dankMaterialShell.greeter = {
            enable = true;
            compositor.name = "niri";

            configHome = "/home/mister";
          };

          programs.niri = {
            enable = true;
            package = pkgs.niri-unstable;
          };
        })
      ];
    };
  };
}
