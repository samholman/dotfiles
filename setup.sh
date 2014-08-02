#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf $DIR/.bash_profile ~
ln -sf $DIR/.bashrc ~
ln -sf $DIR/.gitconfig ~
ln -sf $DIR/.tmux.conf ~
ln -sf $DIR/.vimrc ~
ln -sf $DIR/.vim ~
ln -sf $DIR/.tmuxinator ~

echo "Links created."
