#!/bin/zsh

if (( $+commands[tsc] )); then
    success-message 'typescript installed'
else
    information-message 'installing typescript'

    npm install -g typescript
fi
