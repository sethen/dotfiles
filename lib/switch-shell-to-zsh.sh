#!/bin/zsh

SHELL=$(echo $SHELL)

if [[ ! -n $(echo $SHELL | grep zsh) ]]; then
    WHICH_ZSH=$(which zsh)

    echo "changing shell to $WHICH_ZSH"

    chsh -s $WHICH_ZSH
fi
