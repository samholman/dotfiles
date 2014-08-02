#!/bin/bash

# These files will be linked into ~
declare -a FILES=(
    '.bash_profile'
    '.bashrc'
    '.gitconfig'
    '.tmux.conf'
    '.tmuxinator'
    '.vimrc'
    '.vim'
)

function setup() {
    # Find dotfiles dir
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    # Update repo first
    echo "Updating..."
    pushd $DIR
    git pull
    popd

    # Link files
    for f in "${FILES[@]}"; do
        ln -sf $DIR/$f $HOME
        echo "Linked $f"
    done

    echo "All symlinks created."
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    setup
else
    read -p "This will overwrite existing files in your home directory. Are you sure? [y/n] " -n 1
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        setup
    else
        echo "Aborted."
    fi
fi

# Finish up
unset setup
[ -f "$HOME/.bash_profile" ] && source "$HOME/.bash_profile"

