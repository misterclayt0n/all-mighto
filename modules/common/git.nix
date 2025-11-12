{ pkgs, ... }:
{
  home-manager.sharedModules = [{
    home.packages = with pkgs; [ git gh ];

    programs.git = {
      enable               = true;
      settings.user.email  = "misterclayt0n";
      settings.user.name   = "daviarantes13@gmail.com";

      settings = {
        init.defaultBranch = "main";
        color.ui           = "auto";
        core.editor        = "hx";
        core.pager         = "delta";
      };
    };

    programs.gh = {
      enable                = true;
      settings.git_protocol = "ssh";
    };
  }];
}

