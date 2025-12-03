{ pkgs, inputs, ... }: {
  home-manager.sharedModules = [{
    programs.ghostty = {
      enable  = true;
      package = inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default;

      settings = {
        font-family       = "Iosevka";
        command           = "bash -l -c nu";
        # theme             = "config-dankcolors";
        config-file       = "~/.config/ghostty/config-dankcolors";
        # window-decoration = "false";
        gtk-titlebar      = false;
        keybind = [
          "ctrl+shift+w=close_surface"
          "ctrl+shift+h=new_split:down"
        ];
      };
    };
  }];
}

