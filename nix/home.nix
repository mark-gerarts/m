{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
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

  # Vim configuration
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = [
      pkgs.vimPlugins.vim-nix
    ];
  };

  programs.git = {
    enable = true;
    userName = "Mark Gerarts";
    userEmail = "mark.gerarts@gmail.com";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -lAh --color=auto";
      ".." = "cd ..";
    };
  };

  home.packages = [
    # Notes
    pkgs.obsidian
    pkgs.insync
  ];
}
