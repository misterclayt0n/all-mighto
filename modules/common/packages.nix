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
    eza
    alacritty
    fuzzel
    zvm # Fuck you zig for having me to download a version manager in nix because yall can't package correctly for this shit.
  ];
}

