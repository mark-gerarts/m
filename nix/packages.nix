{ config, lib, pkgs, ... }:

let
  # This allows to fetch some specific packages from unstable. Someone please
  # stop me if this is a bad idea.
  unstable = import <nixos-unstable> {};
in {
  home.packages = with pkgs; [
    # Notes
    unstable.obsidian # The stable version does not work.
    pandoc

    # Quickly run stuff
    nix-alien
    comma

    # Copy stuff commandline
    xclip

    # Chat
    signal-desktop

    # System
    tree
    htop
    less
    filelight
    unzip
    zip
    neofetch

    # More example based manpages
    tldr

    # Dev
    # Some of these are better of in a shell.nix, but I still don't have one for
    # every project.
    jq
    docker-compose
    mkcert
    nodePackages.npm
    nodejs

    # Music
    spotify

    # Work
    networkmanager-openvpn
    libreoffice

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

    # Fonts
    fira-code
    fira-code-symbols
  ];
}
