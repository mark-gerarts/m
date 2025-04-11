{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./device-specific-configuration.nix
    ];

  ##
  ## Config
  ##

  # Forgive me for my sins, RMS.
  nixpkgs.config.allowUnfree = true;

  boot.loader.grub = {
    enable = true;
    useOSProber = true;
  };

  time = {
    timeZone = "Europe/Brussels";
    hardwareClockInLocalTime = true; # To please Windows...
  };

  services.printing.enable = true;

  networking.networkmanager.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";

  # For quick hostfile changes (lost on rebuild)
  environment.etc.hosts.mode = "0644";

  # Sound.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.mark = {
    isNormalUser = true;
    description = "Mark";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
  };
  nix.settings.trusted-users = [ "root" "mark" ];

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30d";
  };

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

  system.autoUpgrade = {
    enable = true;
    persistent = true;
    dates = "daily";
  };

  ##
  ## Gnome
  ##

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # TODO: I do the following steps manually for now, can we set this up
    # automatically?
    # https://github.com/qwerty-fr/qwerty-fr/issues/49#issuecomment-1405254634
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    cheese
    gnome-music
    epiphany
    geary
    totem
    tali
    iagno
    hitori
    atomix
    yelp
    seahorse
    gnome-contacts
    gnome-initial-setup
  ]);

  ##
  ## Virtualisation
  ##

  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;

      # By default, docker uses oversized network ranges, resulting in less
      # total available networks. We override the default address pools to use
      # smaller ranges, thus creating more possible networks.
      #
      # @see https://straz.to/2021-09-08-docker-address-pools/
      daemon.settings = {
        default-address-pools = [
          {
            base = "172.17.0.0/12";
            size = 20;
          }
          {
            base = "192.168.0.0/16";
            size = 24;
          }
        ];
      };
    };
  };

  ##
  ## Packages
  ##

  programs = {
    firefox.enable = true;
    gnupg.agent.enable = true;
  };

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    # System essentials
    vim
    wget
    git
    delta

    # Dev
    vscode
    gnome-terminal

    # Gnome extensions
    gnome-tweaks
    gnomeExtensions.blur-my-shell
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-dock
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
