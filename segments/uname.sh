#!/usr/bin/env sh
# Prints tmux prefix info.
# Assuems that [ -n "$TMUX"].
#tmux list-keys| grep prefix | perl -pi -e 's/bind-key[\s]*(.*)[\s]send-prefix/$1/'
uname
exit 0;
