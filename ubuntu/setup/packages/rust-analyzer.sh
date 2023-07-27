#!/bin/zsh

if (( $+commands[rust-analyzer] )); then
    success-message 'rust-analyzer installed'
else
    information-message 'installing rust-analyzer'

    rustup component add rust-analyzer
fi
