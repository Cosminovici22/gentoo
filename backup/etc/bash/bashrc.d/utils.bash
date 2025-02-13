export HISTCONTROL="$HISTCONTROL erasedups:ignoreboth"

alias ls="ls -ahlp --color"
alias cp="cp -ir"
alias ip="ip -c"
alias mv="mv -i"
alias rm="rm -Ir"
cd() { command cd -P "$@" && ls; }
sudo() { su -mc "$*"; }

! shopt -q login_shell && ls
