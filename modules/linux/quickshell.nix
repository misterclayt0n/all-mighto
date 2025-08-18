{ inputs, pkgs, ... }:

{
  home-manager.sharedModules = with pkgs; [{
    home.packages = [
      (inputs.quickshell.packages.${stdenv.hostPlatform.system}.default)

      # Quickshell packages for my rice.
      material-symbols
      swww
      matugen
      cava
      gpu-screen-recorder
      brightnessctl
      ddcutil
      libnotify
    ];
  }];
}
