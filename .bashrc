# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias vi='vim'

export PATH=~/bin:~/.config/composer/vendor/bin:$PATH
export PS1="\[\e[0m\]\[\e[1;32m\][\[\e[1;37m\]\u\[\e[1;30m\]@\[\e[0m\]\h \[\e[1;30m\]\W\[\e[1;32m\]]\\$\[\e[0m\] "
export LS_OPTIONS='--color=auto -A -b'
