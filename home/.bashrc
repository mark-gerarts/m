export PATH=/home/mark/.npm-packages/bin:$PATH
export PATH=/home/mark/.local/bin:$PATH
export PATH=/home/mark/.nimble/bin:$PATH

alias ll="ls -vlAh --color=auto --group-directories-first"
alias ..="cd .."
alias u="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias cd..="cd .."

alias docker-composer="docker compose"
alias docker-compose="docker compose"
alias k="kubectl"
alias kdebug="kubectl run -i --tty --rm debug --image=arunvelsriram/utils --restart=Never -- bash"
alias sl="ls"
alias it="git"
alias gti="git"
alias gut="git"
alias got="git"

alias glg="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(blue)- [%an]%C(reset)%C(bold yellow)%d%C(reset)'"
alias gls="glg"
alias glga="git log --branches --remotes --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(blue)- [%an]%C(reset)%C(bold yellow)%d%C(reset)'"

if command -v doas >/dev/null 2>&1; then
  alias poweroff="doas /sbin/poweroff"
  alias reboot="doas /sbin/reboot"
else
  alias poweroff="sudo poweroff"
  alias reboot="sudo reboot"
fi

alias cclip="xclip -selection clipboard"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

alias sbcl="rlwrap sbcl"

alias todos="vim ~/.todos.md"

alias prettyjson="python3 -m json.tool"

alias diff="diff --color"

alias ns="nix-shell"

# Fix code asking password on startup
alias code="codium"
alias code.="codium ."
alias codium="codium --password-store=basic"

# Node
alias node-repl="noderepl"
noderepl() {
    FILE_CONTENTS="$(< "$1" )"
    node -i -e "$FILE_CONTENTS"
}

# mkdir + cd
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Make a temporary directory to test some stuff in. Popd to return.
tempdir () {
  temp_dir="$(mktemp -d)"
  chmod -R 0700 "$temp_dir"
  pushd "$temp_dir" > /dev/null
}

# Android
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# Microsoft...
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1

RED='\[\e[0;31m\]'
GREEN='\[\e[0;32m\]'
BYELLOW='\[\e[1;33m\]'
BWHITE='\[\e[1;37m\]'

function smile_prompt
{
  if [ "$?" -eq "0" ]; then
    SC="${GREEN}:)"
  else
    SC="${RED}:("
  fi
  if [ $UID -eq 0 ]; then
    UC="${RED}"
  else
    UC="${BYELLOW}"
  fi
  #hostname color
  HC="${BYELLOW}"
  #regular color
  RC="${BWHITE}"
  #default color
  DF='\[\e[0m\]'
  PS1="[${UC}\u${RC}@${HC}\h${RC}:\w${DF}] ${SC}${DF}\n\$ "

  # Set terminal title
  echo -ne "\033]0;$(basename $PWD)\007"

  [[ $(type -t __vte_prompt_command) == function ]] && __vte_prompt_command
}
PROMPT_COMMAND="smile_prompt"

HISTCONTROL=ignoredups:erasedups
HISTSIZE=20000
HISTFILESIZE=20000

# Save to bash history on every prompt.
shopt -s histappend
# TODO: this doesn't seem to work properly in combination with smile_prompt
PROMPT_COMMAND="$PROMPT_COMMAND;history -a;"

# Allow bookmarking directories:
# $ mark @name /path/to/dir
# $ mark @name # Defaults to $PWD
# $ cd @name
# $ cd @<tab> # List all available bookmarks
# Credit: https://news.ycombinator.com/item?id=35122780
mkdir -p ~/.marks/
export CDPATH=.:~/.marks/
mark() {
    local target="${2:-$(pwd)}"
    ln -s "$target" "$HOME/.marks/$1"
}
