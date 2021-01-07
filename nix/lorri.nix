{ config, lib, pkgs, ... }:

{
  services.lorri.enable = true;

  # We don't use the bashIntegration, since we customize it. See bash.nix.
  programs.direnv.enable = true;
}
