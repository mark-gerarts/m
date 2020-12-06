{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      # Navigating the filesystem
      ll = "ls -vlAh --color=auto --group-directories-first";
      ".." = "cd ..";

      # I can't type
      docker-composer = "docker-compose";
      sl = "ls";
      it = "git";
      gti = "git";
      gut = "git";
      "cd.." = "cd ..";

      # Git
      glg = "git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(blue)- [%an]%C(reset)%C(bold yellow)%d%C(reset)'";
      glga = "git log --branches --remotes --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(blue)- [%an]%C(reset)%C(bold yellow)%d%C(reset)'";
      gls = "glg";
      spp = "~/.spp.sh";

      # Power
      poweroff = "sudo poweroff";
      reboot = "sudo reboot";

      # Utilities
      cclip = "xclip -selection clipboard";
      prettyjson = "python -m json.tool";

      # Symfony
      untranslated="echo -n \"<target.*>[^\\s]*\\.[^\\s]*</target>\" | cclip | echo \"Copied to clipboard!\"";
      untranslated-csv="echo -n \";(\\\"|)[^\\s]*\\.[^\\s]*\" | cclip | echo \"Copied to clipboard!\"";
    };
  };
}
