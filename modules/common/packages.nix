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
    claude-code
    gcc
    xwayland-satellite
    slack
    yazi    
    postgresql
    zvm # Fuck you zig for having me to download a version manager in nix because yall can't package correctly for this shit.
    pciutils
    ouch
  ];
}

