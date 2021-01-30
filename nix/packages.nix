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
    pandoc

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

    # Images
    kdeApplications.gwenview

    # System
    tree
    htop
    less
    filelight
    unzip
    neofetch

    # More example based manpages
    tldr

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
    imagemagick
    plantuml

    # Music
    spotify

    # Work
    networkmanager-openvpn
    plasma5.plasma-nm
    libreoffice
    thunderbird
    birdtray
    kdeApplications.kcalc

    # Required for gpg.
    pinentry

    # For the Linux ISOs :^)
    deluge

    # For spellchecking in vscode+latex
    hunspell
    hunspellDicts.en_US
    hunspellDicts.en_GB-large

    # Nix tooling
    nix-index

    # Custom hacked together derivations
    (callPackage ./custom-derivations/ddev/default.nix { })
    (callPackage ./custom-derivations/comma/default.nix { })
  ];
}
