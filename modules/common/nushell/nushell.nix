{ pkgs, ... }: {
  home-manager.sharedModules = [{
    programs.nushell = {
      enable            = true;
      configFile.source = ./config.nu;
    };
  }];
}
