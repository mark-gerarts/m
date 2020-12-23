{ config, lib, pkgs, ... }:

{
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;

    # Workaround taken from here:
    # https://github.com/nix-community/home-manager/issues/908#issuecomment-563464145
    extraConfig = ''
      pinentry-program ${pkgs.pinentry.qt}/bin/pinentry
    '';
  };
}
