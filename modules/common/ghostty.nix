{ pkgs, ... }: {
  home-manager.sharedModules = [{
    programs.ghostty = {
      enable  = true;
      package = pkgs.ghostty;

      settings = {
        font-family       = "Iosevka";
        command           = "bash -l -c nu";
        theme             = "Iceberg Light";
        window-decoration = "false";
        gtk-titlebar      = false;
        keybind = [
          "ctrl+shift+w=close_surface"
          "ctrl+shift+h=new_split:down"
        ];
      };
    };
  }];
}

