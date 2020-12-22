# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./xserver
      ./hardware-configuration.nix
      ./virtualisation.nix
      ./security.nix
      ./device-specific-configuration.nix
    ];

  # Set your time zone.
  time.timeZone = "Europe/Brussels";
  time.hardwareClockInLocalTime = true; # To please Windows...

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;

  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users = {
    users.mark = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "docker"];
    };
  };

  # Clean up old generations automatically.
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 30d";

  environment.systemPackages = with pkgs; [
    # Essential system stuff, the rest is defined in home-manager.
    wget
    git
    vim

    # To manage SDDM settings in a GUI.
    plasma5.sddm-kcm
  ];

  # Forgive me for my sins, RMS
  nixpkgs.config.allowUnfree = true;

  # This is required for L2TP VPN.
  services.strongswan = {
    enable = true;
    secrets = [
      "ipsec.d/ipsec.nm-l2tp.secrets"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
