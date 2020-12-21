{ config, lib, pkgs, ... }:

{
  # For testing purposes.
  programs.chromium = {
    enable = true;
  };
}
