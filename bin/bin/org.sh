#!/usr/bin/env sh

exec /opt/homebrew/bin/emacsclient -a "" \
  -n -e "(run-at-time 0 nil #'activate-capture-frame)"
