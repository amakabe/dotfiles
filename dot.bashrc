[ -z "$PS1" ] && return

HISTSIZE=1000000
HISTCONTROL=ignoreboth

PS1='\u@\h:\w\$ '

shopt -s histappend
shopt -s histverify
shopt -s checkwinsize
shopt -s no_empty_cmd_completion

set -o vi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

