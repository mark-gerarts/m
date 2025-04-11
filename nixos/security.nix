{ config, lib, pkgs, ...}:

{
  security.sudo = {
    enable = true;

    extraRules = [{
      runAs = "root";
      groups = [ "wheel" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/reboot";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/poweroff";
          options = [ "NOPASSWD" ];
        }
      ];
    }];
  }
}
