# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="xiong-chiamiov-plus"
ZSH_THEME="bira"

# Which plugins would you like to load? 
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions 
  history-substring-search
)

###############################################################
# => exports
###############################################################

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# put the scripts in the path
export PATH=~/bin:$PATH

# set editor
export VISUAL=vim
export EDITOR="$VISUAL"

# add miniconda to path
# export PATH=/opt/miniconda/bin:$PATH

###############################################################
# => misc
###############################################################

# vim mode in CL
bindkey -v  

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
alias gco="git checkout"
# store credentials
alias gsc="git config credential.helper store"

alias sai="sudo apt install"
alias pi="sudo pacman -S"
alias pr="sudo pacman -R"

alias v="vim"
alias vrc="vim ~/.vim/vimrc"
alias zrc="vim ~/.zshrc"
alias mrc="vim ~/.config/mutt/muttrc"
alias nrc="vim ~/.newsboat/config"
alias rrc="vim ~/.config/ranger/rc.conf"
alias irc="vim ~/.config/i3/config"
alias prc="vim ~/.config/polybar/config"

alias R="R --quiet --no-save"
alias t="tmux"
alias r="ranger"

alias decryptdropbox="encfs ~/Dropbox/Encrypted/ ~/Private"

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

###############################################################
# => plugin config
###############################################################

# autosuggestions
bindkey '^s' autosuggest-execute
bindkey '^e' autosuggest-execute
bindkey '^ ' autosuggest-accept

# history substring search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down


# ### Other ###
# # hacky :(
xset r rate 180 70
setxkbmap -option ctrl:nocaps
setxkbmap -option ctrl:ralt_rctrl
xmodmap -e "keycode 64 = Escape"
