#!/usr/bin/env sh
# Prints tmux prefix info.
# Assuems that [ -n "$TMUX"].
#tmux list-keys| grep prefix | perl -pi -e 's/bind-key[\s]*(.*)[\s]send-prefix/$1/'
tmux list-keys| grep prefix | sed -e 's/bind-key[ \n\r\f\t]*\(.*\)[ \n\r\f\t]send-prefix/\1/'
exit 0;
