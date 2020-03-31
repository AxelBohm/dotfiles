#!/bin/bash

papers_directory=~/Dropbox/papers

paper=$(find "$papers_directory"* -type f | cut -d"/" -f6- | fzf)
nohup zathura "$papers_directory/$paper" &> /dev/null
