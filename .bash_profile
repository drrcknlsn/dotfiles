# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.config/composer/vendor/bin

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
  PS1+="\[\$(prompt_git \"$bcyan\" \"$bred\")"
  PS1+="\[$bgreen\]]\\$"
  PS1+="\[$reset\] "

  export PS1
}

PROMPT_COMMAND=set_prompt
export PROMPT_COMMAND

LS_OPTIONS='--color=auto -A -b'

export LS_OPTIONS

# Automatically start/resume screen on login
[ -z "$STY" ] && screen -R
