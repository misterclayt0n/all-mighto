{ ... }:
let
  enabled = attrs: { enable = true; } // attrs;
in {
  environment.variables = {
    MANPAGER = "bat --plain";
    PAGER    = "bat --plain";
  };
  environment.shellAliases = {
    cat  = "bat";
    less = "bat --plain";
  };

  home-manager.sharedModules = [{
    programs.bat = enabled {
      config = {
        theme = "Nord";
        pager = "less --quit-if-one-screen --RAW-CONTROL-CHARS";
      };
    };
  }];
}
