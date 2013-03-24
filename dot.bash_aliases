if [ `uname` = "Darwin" ]
then
  alias ls="ls -G"
elif [ `uname` = "Linux" ]
then
  alias ls="ls --color=auto"
fi

alias ll="ls -l"
alias la="ll -a"
alias lh="la -h"

