{ config, pkgs, ... }:

{
  imports = [
    ./vim.nix
    ./git.nix
    ./bash.nix
    ./firefox.nix
    ./vscode.nix
    ./texlive.nix
    ./packages.nix
    ./bat.nix
    ./pass.nix
    ./chromium.nix
    ./gpg.nix
    ./lorri.nix
    ./files.nix
  ];

  programs.home-manager.enable = true;

  home.username = "mark";
  home.homeDirectory = "/home/mark";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  # For some reason I don't yet understand, man conflicts with the
  # system's man (on Debian). These following two lines solve this
  # issue, though they are thus probably not needed on nixOS.
  # See: https://github.com/nix-community/home-manager/issues/432
  # (Alternatively, try setting LANG as sugested in the thread).
  programs.man.enable = false;
  home.extraOutputsToInstall = [ "man" ];

  # Prevent home-manager from managing the keyboard, otherwise it will ovewrite
  # any setting done in the NixOS configuration.
  home.keyboard = null;
}
