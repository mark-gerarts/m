{ config, lib, pkgs, ...}:

{
  services.xserver = {
    enable = true;

    displayManager = {
      sddm.enable = true;
      defaultSession = "plasma5";
      sessionCommands = "setxkbmap -layout qwerty-fr";
    };

    desktopManager.plasma5 = {
      enable = true;
    };

    layout = "qwerty-fr";

    extraLayouts = {
      qwerty-fr = {
        description = "QWERTY with French symbols and diacritics http://marin.jb.free.fr/qwerty-fr/";
        languages = [ "eng" ];
        symbolsFile = /m/nixos/xserver/us_qwerty-fr;
      };
    };
  };
}
