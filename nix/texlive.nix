{ config, lib, pkgs, ... }:

{
  #

  programs.texlive = {
    enable = true;

    extraPackages = texlive: {
      inherit (texlive)
        # Just install the whole damn thing, I'm not in the mood to go search
        # every single individual package I need.
        #
        # In case I ever change my mind, this page lists all available packages:
        # https://raw.githubusercontent.com/NixOS/nixpkgs/master/pkgs/tools/typesetting/tex/texlive/pkgs.nix
        # E.g. `collection-formatsextra` etc.
        scheme-full;
    };
  };
}
