{ config, pkgs, ... }:

let
  unstable =
    import (builtins.fetchTarball "https://github.com/nixos/nixpkgs/tarball/nixos-unstable")
      { config = config.nixpkgs.config; };
in
{
  imports = [
    ./hardware-configuration.nix
    ./device-specific-configuration.nix
  ];

  # Forgive me for my sins, RMS.
  nixpkgs.config.allowUnfree = true;

  time = {
    timeZone = "Europe/Brussels";
    hardwareClockInLocalTime = true; # To please Windows...
  };

  services.printing.enable = true;

  networking.networkmanager.enable = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "nl_BE.UTF-8";
    };
  };

  # For quick hostfile changes (lost on rebuild)
  environment.etc.hosts.mode = "0644";

  # Sound.
  services.pulseaudio.enable = false;
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
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = with pkgs; [ ];
  };
  nix.settings.trusted-users = [
    "root"
    "mark"
  ];

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
  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "10s";
  };

  system.autoUpgrade = {
    enable = true;
    persistent = true;
    dates = "weekly";
  };

  # Allow poweroff/reboot without password.
  security.sudo.extraRules = [
    {
      runAs = "root";
      groups = [ "wheel" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/reboot";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/poweroff";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  services.displayManager.autoLogin = {
    enable = true;
    user = "mark";
  };

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (
    with pkgs;
    [
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
      gnome-shell-extensions
      gnome-calculator
    ]
  );

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
    java.enable = true; # Needed for ltex
  };

  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    requires = [ "network-online.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  environment.systemPackages = with pkgs; [
    # System essentials
    vim
    wget
    git
    delta
    inotify-tools

    # DE stuff
    gnome-tweaks
    gnome-terminal
    gnome-extension-manager
    gnomeExtensions.blur-my-shell
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-dock
    gnomeExtensions.runcat
    qwerty-fr
    qalculate-gtk
    smile
    dconf-editor

    # CLI
    bat
    pass
    pandoc
    xclip
    tree
    comma
    htop
    ncdu
    zip
    jq
    fastfetch
    imagemagick
    unzip

    # Apps
    vscodium-fhs
    chromium
    pass
    obsidian
    signal-desktop
    kdePackages.filelight
    spotify
    libreoffice
    unstable.jabref # Regular jabref fails to build atm (6.0-alpha.3).
    evince
    gnome-disk-utility

    # Latex
    hunspell
    hunspellDicts.en_US
    hunspellDicts.en_GB-large
    texliveFull

    # Nix tooling
    nix-index
    nix-ld
    nixfmt

    # Fonts
    fira-code
    fira-code-symbols

    # Dev
    python314
    duckdb
    distrobox
    dotnet-sdk_9
    fantomas
    shellcheck
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
