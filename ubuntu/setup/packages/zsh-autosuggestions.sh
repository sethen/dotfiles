#!/bin/zsh

if [[ -d $ZSH_AUTOSUGGESTIONS_DIRECTORY ]]; then
    success_message 'zsh-autosuggestions installed'
else
    information_message 'installing zsh-autosuggestions'

    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUGGESTIONS_DIRECTORY
fi
