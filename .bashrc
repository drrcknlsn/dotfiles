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
else
  alias ls='ls $LS_OPTIONS'
fi

alias vi='vim'
alias ls='/bin/ls $LS_OPTIONS'
