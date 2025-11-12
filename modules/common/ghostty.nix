{ pkgs, ... }: {
  home-manager.sharedModules = [{
    programs.ghostty = {
      enable  = true;
      package = pkgs.ghostty;

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

