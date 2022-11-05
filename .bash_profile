# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

function path_prepend() {
  if [ -d "$1" ] && [[ ! "$PATH" =~ (^|:)${1}($|:) ]]; then
    PATH="$1:$PATH"
  fi
}

function path_append() {
  if [ -d "$1" ] && [[ ! "$PATH" =~ (^|:)${1}($|:) ]]; then
    #PATH="${PATH:+"$PATH:"}$1"
    PATH="$PATH:$1"
  fi
}

# Global bin overrides
path_prepend $HOME/obin

path_append $HOME/.local/bin
path_append $HOME/bin
path_append $HOME/.composer/vendor/bin
path_append $HOME/.config/composer/vendor/bin
path_append $HOME/.npm/bin
path_append $HOME/.vim/bundle/fzf/bin
# MacOS
path_append /opt/homebrew/bin
path_append /opt/homebrew/sbin

export PATH

function set_prompt() {
  local \
    reset="\e[0m" \
    black="\e[0;30m" \
    red="\e[0;31m" \
    green="\e[0;32m" \
    yellow="\e[0;33m" \
    blue="\e[0;34m" \
    magenta="\e[0;35m" \
    cyan="\e[0;36m" \
    white="\e[0;37m" \
    bblack="\e[1;30m" \
    bred="\e[1;31m" \
    bgreen="\e[1;32m" \
    byellow="\e[1;33m" \
    bblue="\e[1;34m" \
    bmagenta="\e[1;35m" \
    bcyan="\e[1;36m" \
    bwhite="\e[1;37m"

  function prompt_git() {
    git rev-parse --is-inside-work-tree &>/dev/null || return
    branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
      git describe --all --exact-match HEAD 2> /dev/null || \
      git rev-parse --short HEAD 2> /dev/null || \
      echo '(unknown)')";
    dirty=$(git diff --no-ext-diff --quiet --ignore-submodules --exit-code || echo -e "*")
    [ -n "${s}" ] && s=" [${s}]";
    echo -e " ${1}${branchName}${2}$dirty";

    return
  }

  PS1="\[$reset\]"
  PS1+="\[$bgreen\]["
  PS1+="\[$bwhite\]\u"
  PS1+="\[$bblack\]@"
  PS1+="\[$white\]\h "
  PS1+="\[$bblack\]\W"
  PS1+="\$(prompt_git \"\[$bcyan\]\" \"\[$bred\]\")"
  PS1+="\[$bgreen\]]\\$"
  PS1+="\[$reset\] "

  export PS1
}

PROMPT_COMMAND=set_prompt
export PROMPT_COMMAND

LS_OPTIONS='--color=auto -b -h -l --group-directories-first'
export LS_OPTIONS

CLICOLOR=1
export CLICOLOR

EDITOR=$(which vim)
export EDITOR

function update_tlds() {
  wget -qO- https://data.iana.org/TLD/tlds-alpha-by-domain.txt | grep -v '^#' | tr '[:upper:]' '[:lower:]' > ~/.dotfiles/tlds.txt
}

function real_whois() {
  if [ ! -f ~/.dotfiles/tlds.txt ]; then
    update_tlds
  fi

  local tlds=$(cat ~/.dotfiles/tlds.txt | paste -sd '|' -)
  local tld=$(echo $1 | grep -oP "\b($tlds)$")
  local host_for_tld

  if [ $tld = "dev" ]; then
    host_for_tld=whois.nic.google
  else
    host_for_tld=$(whois -h whois.iana.org $tld | grep '^whois:' | sed 's/whois:\s*//')
  fi

  whois -h $host_for_tld $1
}

export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
    find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'

# Disable Ctrl-s
stty -ixon
stty stop ""


if [ -f ~/.bash_profile.local ]; then
  . ~/.bash_profile.local
fi

# Stop MacOS's default shell nagging
export BASH_SILENCE_DEPRECATION_WARNING=1

# Automatically start/resume screen on login
[ -z "$STY" ] && screen -U -D -RR
