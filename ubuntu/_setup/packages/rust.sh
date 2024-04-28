#!/bin/zsh

if (( $+commands[rustup] )); then
    success-message 'rust installed'
else
    information-message 'installing rust'

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if (( $+commands[rust-analyzer] )); then
    success-message 'rust-analyzer installed'
else
    information-message 'installing rust-analyzer'

    rustup component add rust-analyzer
fi
