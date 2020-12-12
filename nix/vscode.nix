{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    # @todo: extensions + settings can be managed here as well.
}