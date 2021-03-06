# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# set vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# disable ^-q and ^-s
stty -ixon
# cycle through completions
bind "TAB:menu-complete"
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

# use z installed from package manager
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# case insensitive tab completion
bind 'set completion-ignore-case on'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

bind '"\e[A": history-search-backward'            # arrow up
bind '"\e[B": history-search-forward'             # arrow 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/xel/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/xel/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/xel/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/xel/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

