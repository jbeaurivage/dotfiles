# Path to your oh-my-zsh installation.
export ZSH="/$HOME/.oh-my-zsh"

# Enable tmuxp
export DISABLE_AUTO_TITLE='true'

# Set name of the theme to load.
ZSH_THEME="agnoster-short"

#Default user prompt
DEFAULT_USER="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git battery jump zsh-syntax-highlighting rustup)

source $ZSH/oh-my-zsh.sh

# Autojump
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Folder shortcuts
bbsrc="$HOME/blacbox-gps/blackbox-src"
bbpcb="$HOME/blackbox-gps/blackbox-pcb"


################
# User aliases #
################

# Zypper
alias zyp="zypper"
alias sz="sudo zypper"

# rm and ls
alias rmi="rm -i"
alias rmr="rm -r"
alias rmir="rm -ir"

alias lsa="ls -1FG"
alias lsl="ls -l"
alias lsaa="ls -a1FG"
alias lsg="ls | grep"
alias lsga="ls -a | grep"

# cd and pushd
alias pd="pushd"

# ps
alias psg="ps aux | grep"

# push line key binding
bindkey '^L' push-line

# clear
alias c="clear"

# dir shortcuts

# Colorize grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Clipboard
alias clip='xargs echo -n | xclip -sel clip'
alias cpwd='pwd | clip'

# Get IP addr
alias publicip="curl icanhazip.com"

# apps
function kt(){
    kate $1 &>/dev/null &
}

function skt(){
    kdesu kate $1 &>/dev/null &
}

function o(){
    xdg-open $1 &>/dev/null &
}

alias op="dolphin . &>/dev/null &"

alias zshconfig="nvim ~/.zshrc"
alias vimconfig="nvim ~/.config/nvim/init.vim"


# Change vim path
alias svim='sudo vim'
alias snano='sudo nano'
alias nv='nvim'
alias snv='sudo nv'

# Editors
export GIT_EDITOR=nvim
export VISUAL=nvim
export EDITOR="$VISUAL"

# mkdir auto cd
function mcd (){
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

function cdir (){
	cd $(dirname $1)
}

# Enable VIM mode in zsh
bindkey -v
