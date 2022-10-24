{ config, lib, pkgs, ...}:

{
  services.xserver = {
    enable = true;

    # Maybe switch to gdm if completely convinced of gnome.
    displayManager = {
      sddm.enable = true;
      defaultSession = "plasma";
    };

    desktopManager = {
      plasma5.enable = true;
      gnome.enable = true;
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
    # keyboard options, or directly here in the config. But hey, I spent enough
    # time on just getting it to work already.
    extraLayouts = {
      qwerty-fr = { # @todo: move setxkbmap to autostart via desktop entry
        description = "QWERTY with French symbols and diacritics http://marin.jb.free.fr/qwerty-fr/";
        languages = [ "eng" ];
        symbolsFile = /m/nixos/xserver/us_qwerty-fr;
      };
    };
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese
    gnome-music
    gnome-terminal # would need this w/o kde
    gedit # would need
    epiphany
    geary
    evince # would need
    gnome-characters # would need
    totem
    tali
    iagno
    hitori
    atomix
    seahorse
  ]);
}
