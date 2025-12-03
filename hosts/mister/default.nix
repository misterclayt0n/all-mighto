{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ] ++ import ../../modules/common ;
  
  boot.loader.grub.enable              = true;
  boot.loader.grub.useOSProber         = true;
  boot.loader.grub.efiSupport          = true;
  boot.loader.grub.devices             = [ "nodev" ];
  boot.loader.efi.canTouchEfiVariables = true;

  fonts.packages = with pkgs; [
    iosevka
    nerd-fonts.monaspace
    inter
    material-symbols
    fira-code
  ];

  networking.hostName = "mister";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;
  
  services.pulseaudio.enable                    = false;
  # services.displayManager.sddm.enable         = true;
  # services.desktopManager.plasma6.enable      = true;
  # services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable         = true;
  services.openssh.enable                       = true;
  services.xserver.videoDrivers                 = ["nvidia" "intel"];
  services.power-profiles-daemon.enable         = true;
  services.upower.enable                        = true;

  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="plugdev", TAG+="uaccess", TAG+="udev-acl"
  '';

  services.pipewire = {
    enable            = true;
    alsa.enable       = true;
    alsa.support32Bit = true;
    pulse.enable      = true;
  };

  security.rtkit.enable   = true;
  security.sudo-rs.enable = true;

  users.users.mister = {
    description  = "The greatest";
    isNormalUser = true;
    extraGroups  = [ "wheel" "networkmanager" "docker" "plugdev" "input" ];
  };
  
  hardware.bluetooth.enable      = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.graphics.enable       = true;
  hardware.graphics.enable32Bit  = true;

  virtualisation.docker.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    open               = false;
    nvidiaSettings     = true;
    package            = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload = {
        enable           = true;
        enableOffloadCmd = true;
      };
      
      intelBusId  = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  }; 

  environment.systemPackages   = with pkgs; [ git vim helix ];
  environment.variables.EDITOR = "hx";

  system.stateVersion = "24.11";

  programs.xwayland.enable = true;
  programs.nix-ld.enable   = true;
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  xdg.portal.enable = true;
  
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];
}

