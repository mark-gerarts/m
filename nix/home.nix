{ config, pkgs, ... }:


let
  # This allows to fetch some specific packages from unstable. Someone please
  # stop me if this is a bad idea.
  unstable = import <nixos-unstable> {};
in {
  imports = [
    ./vim.nix
    ./git.nix
    ./bash.nix
    ./firefox.nix
    ./vscode.nix
    ./texlive.nix
  ];

  programs.home-manager.enable = true;

  home.username = "mark";
  home.homeDirectory = "/home/mark";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  # For some reason I don't yet understand, man conflicts with the
  # system's man (on Debian). These following two lines solve this
  # issue, though they are thus probably not needed on nixOS.
  # See: https://github.com/nix-community/home-manager/issues/432
  # (Alternatively, try setting LANG as sugested in the thread).
  programs.man.enable = false;
  home.extraOutputsToInstall = [ "man" ];

  home.packages = with pkgs; [
    # Notes
    unstable.obsidian # The stable version does not work.
    insync

    # Quickly run binaries
    steam-run

    # Copy stuff commandline
    xclip

    # Editors
    kate
    jetbrains.phpstorm

    # Chat
    slack
    tdesktop

    # System
    tree
    htop
    less
    filelight
    unzip
    neofetch

    # Dev
    # Some of these are better of in a shell.nix, but I still don't have one for
    # every project.
    docker-compose
    mkcert
    php
    nodePackages.npm
    nodejs

    # Music
    spotify

    # Work
    networkmanager-openvpn
    plasma5.plasma-nm

    # Custom hacked together derivations
    (callPackage ./custom-derivations/ddev/default.nix { })
  ];
}
