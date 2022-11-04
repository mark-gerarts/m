{ config, lib, pkgs, ... }:

{
  programs.bat = {
    enable = true;

    config = {
      style = "plain";
    };
  };
}
