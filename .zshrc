export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="steeef"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
DISABLE_AUTO_TITLE=true

plugins=(git tmux tmuxinator vagrant phing)

source $ZSH/oh-my-zsh.sh

export GOPATH="$HOME/code/go"
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/local/opt/qt5/bin:$GOPATH/bin:/usr/local/opt/go/libexec/bin:/usr/local/opt/openssl/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_GB.UTF-8
export EDITOR='vim'

setopt auto_cd
cdpath=$HOME/code

source $HOME/.aliases

alias pscli='nocorrect pscli'
