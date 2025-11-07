{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tokei
    delta
    code-cursor
    go
    wl-clipboard
    apple-cursor
    discord
    eza
    gcc
    xwayland-satellite
    slack
    yazi
    postgresql
    zvm # Fuck you zig for having me to download a version manager in nix because yall can't package correctly for this shit.
    pciutils
    ouch
    obs-studio
    steam
    python3
    google-chrome
    zed-editor
    # codex
    amp-cli
    kitty
    # opencode
    # claude-code
    lazydocker
    ripgrep
    cursor-cli
    perf
    gemini-cli
    vial
    qmk-udev-rules
    wine64Packages.stable

    # DankMaterialShell dependencies
    mate.mate-polkit
    hyprpicker
    jq
    grim
    slurp
    grimblast

    fastfetch
    emacs
    nodejs
    koreader
    neovim
    bun
    uv
    hyperfine

    desmume
  ];
}

