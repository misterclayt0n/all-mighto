{ pkgs, ... }: {
  home-manager.sharedModules = [{
    home.packages = with pkgs; [
      xfce.thunar
      xfce.thunar-archive-plugin
      xfce.thunar-media-tags-plugin
      xfce.thunar-volman
      kdePackages.ark
      ffmpegthumbnailer
      libgsf
      xfce.tumbler   # installed only; no HM service for tumbler
    ];
  }];
}
