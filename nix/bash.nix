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
      spp = "/m/home/.scripts/spp.sh";

      # Power
      poweroff = "sudo poweroff";
      reboot = "sudo reboot";

      # Utilities
      cclip = "xclip -selection clipboard";
      prettyjson = "python -m json.tool";
      psg = "ps aux | grep -v grep | grep -i -e VSZ -e";

      # Symfony
      untranslated="echo -n \"<target.*>[^\\s]*\\.[^\\s]*</target>\" | cclip | echo \"Copied to clipboard!\"";
      untranslated-csv="echo -n \";(\\\"|)[^\\s]*\\.[^\\s]*\" | cclip | echo \"Copied to clipboard!\"";

      # Nix
      ns = "nix-shell";
    };

    initExtra = ''
      #Regular text color
      BLACK='\[\e[0;30m\]'
      #Bold text color
      BBLACK='\[\e[1;30m\]'
      #background color
      BGBLACK='\[\e[40m\]'
      RED='\[\e[0;31m\]'
      BRED='\[\e[1;31m\]'
      BGRED='\[\e[41m\]'
      GREEN='\[\e[0;32m\]'
      BGREEN='\[\e[1;32m\]'
      BGGREEN='\[\e[1;32m\]'
      YELLOW='\[\e[0;33m\]'
      BYELLOW='\[\e[1;33m\]'
      BGYELLOW='\[\e[1;33m\]'
      BLUE='\[\e[0;34m\]'
      BBLUE='\[\e[1;34m\]'
      BGBLUE='\[\e[1;34m\]'
      MAGENTA='\[\e[0;35m\]'
      BMAGENTA='\[\e[1;35m\]'
      BGMAGENTA='\[\e[1;35m\]'
      CYAN='\[\e[0;36m\]'
      BCYAN='\[\e[1;36m\]'
      BGCYAN='\[\e[1;36m\]'
      WHITE='\[\e[0;37m\]'
      BWHITE='\[\e[1;37m\]'
      BGWHITE='\[\e[1;37m\]'

      PROMPT_COMMAND=smile_prompt

      function smile_prompt
      {
        if [ "$?" -eq "0" ]
        then
        #smiley
        SC="''\${GREEN}:)"
        else
        #frowney
        SC="''\${RED}:("
        fi
        if [ $UID -eq 0 ]
        then
        #root user color
        UC="''\${RED}"
        else
        #normal user color
        UC="''\${BYELLOW}"
        fi
        #hostname color
        HC="''\${BYELLOW}"
        #regular color
        RC="''\${BWHITE}"
        #default color
        DF='\[\e[0m\]'
        PS1="[''\${UC}\u''\${RC}@''\${HC}\h''\${RC}:\w''\${DF}] ''\${SC}''\${DF} "

        # Add a visual indication if we're in a nix-shell environment.
        if [[ -n "$IN_NIX_SHELL" ]]; then
          PS1="[''\${UC}\u''\${RC}@''\${HC}\h''\${RC}:\w''\${DF}]* ''\${SC}''\${DF} "
        fi
      }

      # Direnv integration with silent output.
      export DIRENV_LOG_FORMAT=""
      eval "$(direnv hook bash)"
    '';
  };
}
