#!/bin/zsh

if (( $+commands[yaml-language-server] )); then
    success-message 'yaml-language-server installed'
else
    information-message 'installing yaml-language-server'

    npm install -g yaml-language-server
fi
