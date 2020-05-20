#!/bin/bash

papers_directory=~/Dropbox/papers

paper=$(find "$papers_directory"* -type f | cut -d"/" -f6- | fzf --reverse --margin=5%,25% --header="Select paper")
zathura "$papers_directory/$paper"
