# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.config/composer/vendor/bin

export PATH

PS1="\[\e[0m\]\[\e[1;32m\][\[\e[1;37m\]\u\[\e[1;30m\]@\[\e[0m\]\h \[\e[1;30m\]\W\[\e[1;32m\]]\\$\[\e[0m\] "

export PS1

LS_OPTIONS='--color=auto -A -b'

export LS_OPTIONS
