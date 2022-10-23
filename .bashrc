# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

if [ -f /usr/local/bin/gls ]; then
  alias ls='/usr/local/bin/gls $LS_OPTIONS'
elif [ -f /opt/homebrew/bin/gls ]; then
  alias ls='/opt/homebrew/bin/gls $LS_OPTIONS'
else
  alias ls='ls $LS_OPTIONS'
fi

alias vi='vim'
alias tree='tree -C'
alias df='df -h'
