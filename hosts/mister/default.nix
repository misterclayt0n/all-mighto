{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ] ++ (import ../../modules/common);
  
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

  environment.systemPackages = with pkgs; [ git vim helix ];

  system.stateVersion = "24.11";
}

