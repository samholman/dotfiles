export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="steeef"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
DISABLE_AUTO_TITLE=true

plugins=(git tmux tmuxinator vagrant phing)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:/usr/local/opt/qt5/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_GB.UTF-8
export EDITOR='vim'

source $HOME/.aliases
