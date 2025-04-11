{ config, lib, pkgs, ...}:

# TODO: check with a vanilla configuration.
# TODO: qwerty-fr is part of nixpkgs nowadays
{
  services.xserver = {
    enable = true;

    displayManager.gdm.enable = true;

    desktopManager.gnome.enable = true;

    layout = "custom";

    extraLayouts = {
      custom = {
        description = "QWERTY with French symbols and diacritics http://marin.jb.free.fr/qwerty-fr/";
        languages = [ "eng" ];
        symbolsFile = /m/nixos/xserver/us_qwerty-fr;
      };
    };
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs.gnome; [
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
}
