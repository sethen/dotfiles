#!/bin/zsh

if (( $+commands[typescript-language-server] )); then
    success-message 'typescript-language-server installed'
else
    information-message 'installing typescript-language-server'

    npm install -g typescript-language-server
fi
