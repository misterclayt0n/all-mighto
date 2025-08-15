{ lib, ... }:
let
  enabled = attrs: { enable = true; } // attrs;
in {
  home-manager = {
    useGlobalPkgs   = true;
    useUserPackages = true;

    sharedModules = [{
      xdg = enabled {};
    }];
  };
}

