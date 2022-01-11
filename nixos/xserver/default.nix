{ config, lib, pkgs, ...}:

{
  services.xserver = {
    enable = true;

    displayManager = {
      sddm.enable = true;
      defaultSession = "plasma";
    };

    desktopManager.plasma5 = {
      enable = true;
    };

    layout = "us";

    # I haven't figured out a declarative or nice way to get qwerty-fr working
    # in plasma. The following allows the layout to be set with
    #
    # `setxkbmap -layout qwerty-fr`.
    #
    # Which I have saved to a shell script and configured KDE to run it on
    # startup (NOT session startup, that won't work) in the autostart settings.
    #
    # I'd rather be able to actually install the layout and set it in the
    # keyboard options, or directly here in the config. But hey, I spend enough
    # time on just getting it to work already.
    extraLayouts = {
      qwerty-fr = {
        description = "QWERTY with French symbols and diacritics http://marin.jb.free.fr/qwerty-fr/";
        languages = [ "eng" ];
        symbolsFile = /m/nixos/xserver/us_qwerty-fr;
      };
    };
  };
}
