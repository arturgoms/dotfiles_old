#!/bin/zsh
socket_file=$(~/.config/dotflow/emacsserver)
emacs=/Applications/Emacs.app/Contents/MacOS/Emacs
emacsclient=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient

if [[ $socket_file == "" ]]; then
echo "starting Emacs server..."
env TERM=xterm-256color $emacs -nw --chdir $PWD --execute "(server-start)" $@ &
#$emacs -nw --chdir $PWD --execute "(server-start)" $@ &
else
echo "runnin emacsclient..."
env TERM=xterm-256color $emacsclient -nw $@ --socket-name $socket_file
fi
