#!/usr/bin/env sh

emacsclient -c -F '(quote (name . "capture"))' -e '(activate-capture-frame)'
