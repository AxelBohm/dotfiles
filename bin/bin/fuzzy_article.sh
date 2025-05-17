#!/bin/bash

# open paper in zathura

papers_directory=~/ucloud/my_stuff/papers

paper=$(find "$papers_directory" -type f | sed "s|$papers_directory/||" | fzf --reverse --margin=5%,25% --header="Select paper")

if [[ -n "$paper" ]]; then
    zathura "$papers_directory/$paper"
fi
