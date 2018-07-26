# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# LC_CTYPE=en_US.UTF-8
# LC_ALL=en_US.UTF-8

# Which plugins would you like to load? 
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions 
)

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# oh-my-zsh users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


# put the scripts in the path
export PATH=~/bin:$PATH

# set "prompt"
USER=''

# vim mode in CL
bindkey -v  

# set editor
export VISUAL=vim
export EDITOR="$VISUAL"

# add miniconda to path
export PATH=/opt/miniconda/bin:$PATH


e(){
  evince "$1" & disown && exit
}

# open the the pdf and exit the terminal
z(){
  zathura "$1" & disown && exit
}

# open the the pdf and Keep the terminal
zk(){
  zathura "$1" & disown
}

###############################################################
# => Aliases
###############################################################
alias gc="git commit"
alias ga="git add"
alias gap="git add -p"
alias gs="git status"
alias gd="git diff"
alias gp="git push"
alias gca="git commit --amend"
# store credentials
alias gsc="git config credential.helper store"

alias sai="sudo apt install"
alias pi="sudo pacman -S"
alias pr="sudo pacman -R"

alias v="vim"
alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"

alias R="R --quiet --no-save"
alias t="tmux"

alias encdrop="encfs ~/Dropbox/Encrypted/ ~/Private"

# who can remember this command !?
alias chterm="sudo update-alternatives --config x-terminal-emulator"

# starwars in ascii
alias starwars="telnet towel.blinkenlights.nl"

# Custom cd
c() {
	cd $1;
    ls;
}
alias cd="c"

alias la="ls -A"

### oh-my-zsh ####
bindkey '^s' autosuggest-accept
bindkey '^e' autosuggest-execute
bindkey '^ ' autosuggest-accept

# ### Other ###
# # hacky :(
# xset r rate 180 70
# setxkbmap -option ctrl:nocaps
setxkbmap -option ctrl:ralt_rctrl
