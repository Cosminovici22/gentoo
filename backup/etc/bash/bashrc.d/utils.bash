export HISTCONTROL="$HISTCONTROL erasedups:ignoreboth"

alias ls="ls -ahlp --color"
sudo() { su -mc "$*"; }
cd() { command cd -P "$@" && ls; }
cp() { command cp -ir "$@"; }
mv() { command mv -i "$@"; }
rm() { command rm -Ir "$@"; }

! shopt -q login_shell && ls
