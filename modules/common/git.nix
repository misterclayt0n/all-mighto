{ pkgs, ... }:
{
  home-manager.sharedModules = [{
    home.packages = with pkgs; [ git gh ];

    programs.git = {
      enable    = true;
      userName  = "misterclayt0n";
      userEmail = "daviarantes13@gmail.com";

      extraConfig = {
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

