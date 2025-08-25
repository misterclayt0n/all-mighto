{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ] ++ (import ../../modules/common ) ++ (import ../../modules/linux );
  
  boot.loader.grub.enable              = true;
  boot.loader.grub.useOSProber         = true;
  boot.loader.grub.efiSupport          = true;
  boot.loader.grub.devices             = [ "nodev" ];
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mister";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;
  
  services.pulseaudio.enable             = false;
  services.displayManager.sddm.enable    = true;
  services.desktopManager.plasma6.enable = true;
  services.openssh.enable                = true;
  services.xserver.videoDrivers          = ["nvidia" "intel"];
  
  services.pipewire = {
    enable            = true;
    alsa.enable       = true;
    alsa.support32Bit = true;
    pulse.enable      = true;
  };

  security.rtkit.enable = true;

  users.users.mister = {
    description  = "The greatest";
    isNormalUser = true;
    extraGroups  = [ "wheel" "networkmanager" ];
  };
  
  hardware.bluetooth.enable      = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.graphics.enable       = true;
  hardware.graphics.enable32Bit  = true;

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

  programs.niri.enable = true;
  programs.niri.enable     = true;
  programs.xwayland.enable = true;

  xdg.portal.enable = true;
  
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];
}

