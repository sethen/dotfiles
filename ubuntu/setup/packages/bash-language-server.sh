#!/bin/zsh

if (( $+commands[bash-language-server] )); then
    success-message 'bash-language-server installed'
else
    information-message 'installing bash-language-server'

    npm install -g bash-language-server
fi
