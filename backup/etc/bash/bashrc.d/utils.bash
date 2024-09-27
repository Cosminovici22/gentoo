export HISTCONTROL="$HISTCONTROL erasedups:ignoreboth"

alias ls="ls -ahlp --color"
sudo() { su -mc "$*"; }
cd() { command cd -P "$@" && ls; }
cp() { command cp -i "$@"; }
mv() { command mv -i "$@"; }

! shopt -q login_shell && ls
