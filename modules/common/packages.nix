{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tokei
    delta
    code-cursor
    go
    iosevka
    wl-clipboard
    apple-cursor
    discord
  ];
}

