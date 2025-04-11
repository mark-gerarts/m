{ config, lib, pkgs, ... }:

{
  home.file.".scripts/spp.sh".source = ./../home/.scripts/spp.sh;
}
