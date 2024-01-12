#!/bin/zsh


if (( $+commands[nvim] )); then
    success-message 'neovim installed'
elif (( $+commands[bob] )); then
    information-message 'installing neovim'

    bob install nightly
fi
