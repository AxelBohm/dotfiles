#!/bin/sh

# nvim ~/org/life.org
# nvim ~/vimwiki/index.md
emacsclient -c -F '(quote (name . "capture"))' -e '(activate-capture-frame)'
