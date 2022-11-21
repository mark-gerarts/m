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

  # Explicitly enable 9000 for xdebug.
  networking.firewall.allowedTCPPorts = [ 9000 ];

  # For quick hostfile changes (lost on rebuild)
  environment.etc.hosts.mode = "0644";

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

  nix.trustedUsers = [ "root" "mark" ];

  # Clean up old generations automatically.
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 30d";

  environment.systemPackages = with pkgs; [
    # Essential system stuff, the rest is defined in home-manager.
    wget
    git
    vim

    # Gnome extensions
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.hide-top-bar
    gnomeExtensions.no-title-bar
    gnomeExtensions.pop-shell
    gnomeExtensions.clipboard-history
    gnomeExtensions.blur-my-shell
    gnomeExtensions.application-volume-mixer
    gnome.gnome-terminal
  ];

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  # Forgive me for my sins, RMS
  nixpkgs.config.allowUnfree = true;

  # This is required for L2TP VPN.
  services.strongswan = {
    enable = true;
    secrets = [
      "ipsec.d/ipsec.nm-l2tp.secrets"
    ];
  };

  programs.ssh.startAgent = true;

  users.extraGroups.vboxusers.members = [ "mark" ];

  # The journal takes up 4G by default, no need for that.
  services.journald.extraConfig = ''
    SystemMaxUse=50M
  '';

  # Powering off takes 90s to finish because containerd doesn't get killed
  # properly. This is a workaround. See
  # https://github.com/containerd/containerd/issues/386#issuecomment-304837687
  systemd.services.docker.serviceConfig.KillMode = "mixed";

  # Also, 90s is overkill anyways.
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
