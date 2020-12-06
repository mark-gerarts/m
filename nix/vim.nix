{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = [
      pkgs.vimPlugins.vim-nix
    ];
    extraConfig = ''
      set number
      syntax on
    '';
  };
}
