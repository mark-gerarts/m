{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Mark Gerarts";
    userEmail = "mark.gerarts@gmail.com";
    aliases = {
      co = "checkout";
      st = "status";
    };
    extraConfig = {
      core = {
        editor = "vim";
      };
      push = {
        default = "simple";
      };
      tag = {
        sort = "-version:refname";
      };
    };
  };
}
