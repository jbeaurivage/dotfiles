# Path to your oh-my-zsh installation.
export ZSH="/$HOME/.oh-my-zsh"

# Setup zoxide
eval "$(zoxide init zsh)"

# Enable tmuxp
export DISABLE_AUTO_TITLE='true'

# Set name of the theme to load.
ZSH_THEME="agnoster-short"

#Default user prompt
DEFAULT_USER="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Only enable autocorrect for commands, and not subcommands
unsetopt CORRECT_ALL
setopt CORRECT

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git tmux battery invoke jump zsh-syntax-highlighting rust ssh-agent kubectl)

source $ZSH/oh-my-zsh.sh

# Autojump
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

################
# User aliases #
################

alias kc="kubectl"
alias zj="zellij"

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

# just
alias j="just"

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

# Disable autocorrect
alias cargo="nocorrect cargo"

function o(){
    xdg-open $1 &>/dev/null &
}

alias op="dolphin . &>/dev/null &"

# Editors
export GIT_EDITOR=hx
export VISUAL=hx
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

# zellij
eval "$(zellij setup --generate-auto-start zsh)"
. "$HOME/.cargo/env"
