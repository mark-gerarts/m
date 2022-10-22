{ config, lib, pkgs, ... }:

{
  home.file.".scripts/insync.sh".source = ./../home/.scripts/insync.sh;
  home.file.".scripts/setxkbmap.sh".source = ./../home/.scripts/setxkbmap.sh;
  home.file.".scripts/spp.sh".source = ./../home/.scripts/spp.sh;
}
