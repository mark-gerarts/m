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

      "F3 to print the current time
      nmap <F3> i<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><Esc>
      imap <F3> <C-R>=strftime("%Y-%m-%d %a %H:%M:%S")<CR>
    '';
  };
}
