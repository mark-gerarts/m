{ config, lib, pkgs, ... }:

let
  # This allows to fetch some specific packages from unstable. Someone please
  # stop me if this is a bad idea.
  unstable = import <nixos-unstable> {};
in {
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
    stack
    ghc
    ormolu
    unstable.haskell-language-server # The stable version has a bug with hlint not working

    # Music
    spotify

    # Work
    networkmanager-openvpn
    plasma5.plasma-nm

    # Custom hacked together derivations
    (callPackage ./custom-derivations/ddev/default.nix { })
  ];
}
