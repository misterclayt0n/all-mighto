{
  config,
  pkgs,
  system,
  inputs,
  ...
}:

{
  imports = [
    ./languages/rust.nix
    ./languages/go.nix
    ./languages/c.nix
    ./languages/js.nix
    ./languages/python.nix
    ./languages/odin.nix
    ./languages/zig.nix
    ./languages/lean.nix
    inputs.nvf.homeManagerModules.default
  ];

  home.username = "mister";
  home.homeDirectory = "/home/mister";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neofetch # Nix btw
    fastfetch
    zip
    jujutsu
    gh
    ghostty
    kitty
    nushell
    zoxide
    discord
    delta # Pager (like less).
    ani-cli
    starship
    zed-editor
    emacs
    iosevka
    slack
    apple-cursor
    xcursor-pro
    nix-direnv
    direnv
    obs-studio
    bat
    atuin
    ffmpeg
    yt-dlp
    p7zip
    todoist-electron
    mold
    unzip
    code-cursor
    postgresql
    eza
    nil # Nix language server.
    yazi
    mpv
    google-chrome
    fd
    ripgrep
    wl-clipboard
    imagemagick
    tokei
    steam
    spotify
    fuzzel

    # Quickshell stuff
    qt6Packages.qt5compat
    libsForQt5.qt5.qtgraphicaleffects
    kdePackages.qtbase
    kdePackages.qtdeclarative
    ddcutil
    brightnessctl
    app2unit
    cava
    networkmanager # For nmcli command-line tool
    lm_sensors # Note the underscore
    fish
    aubio
    material-symbols # Font
    nerd-fonts.jetbrains-mono # Jetbrains Mono Nerd Font
    grim
    swappy
    libqalculate

    # Nix related.
    nix-output-monitor # It provides the command `nom` works just like `nix` with more details log output.
    inputs.zen-browser.packages."${system}".default
  ];

  # Generate zoxide script for nushell.
  xdg.configFile."nushell/zoxide.nu".source = pkgs.runCommand "zoxide.nu" { } ''
    		${pkgs.zoxide}/bin/zoxide init nushell --cmd cd > $out
    		'';

  # Generate starship script for nushell.
  xdg.configFile."nushell/starship.nu".source = pkgs.runCommand "starship.nu" { } ''
    		${pkgs.starship}/bin/starship init nu > $out
    		'';

  home.stateVersion = "24.11";

  # services.quickshell = {
    # enable = true;
    # config = ./quickshell-config.qml;
  # };

  xdg.enable = true;
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  #
  # Programs setup.
  #

  programs.ssh = {
    enable = true; # creates ~/.ssh & manages config
    extraConfig = ''
      	    Host github.com
      	      IdentityFile ~/.ssh/id_ed25519
      	      IdentitiesOnly yes
      	  '';
  };

  programs.nvf = {
    enable = true;
    settings = import ../modules/nvf-configuration.nix;
  };

  programs.quickshell = {
    enable = true;
  };

  # Git.
  programs.git = {
    enable = true;
    package = pkgs.gitFull; # GUI and SSH support.
    userName = "misterclayt0n";
    userEmail = "daviarantes13@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };

  # Nushell.
  programs.nushell = {
    enable = true;
    package = pkgs.nushell;
    envFile.source = ./nushell/env.nu;
    configFile.source = ./nushell/config.nu;
  };

  xdg.configFile = {
    # This writes ~/.config/jj/config.toml from the jujutsu.toml file.
    "jj/config.toml".source = ./jujutsu.toml;
    "ghostty/config".text = builtins.readFile ./ghostty.linux;

    # Helix.
    "helix/config.toml".source = ./helix/config.toml;
    "helix/languages.toml".source = ./helix/languages.toml;
    "helix/themes".source = ./helix/themes;

    # Starship.
    "starship.toml".source = ./starship.toml;

    # Zed.
    "zed/settings.json".source = ./zed/settings.json;
    "zed/tasks.json".source = ./zed/tasks.json;
    "zed/keymap.json".source = ./zed/keymap.json;
    "zed/themes".source = ./zed/themes;

    # Doom emacs.
    "doom/config.el".source = ./doom/config.el;
    "doom/init.el".source = ./doom/init.el;
    "doom/packages.el".source = ./doom/packages.el;
    "doom/images".source = ./doom/images;
  };
}
