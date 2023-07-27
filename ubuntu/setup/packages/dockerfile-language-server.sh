#!/bin/zsh

if (( $+commands[docker-langserver] )); then
    success-message 'dockerfile-langserver installed'
else
    information-message 'installing dockerfile-langserver'

    npm install -g dockerfile-language-server-nodejs
fi
