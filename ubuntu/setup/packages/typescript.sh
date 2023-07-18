#!/bin/zsh

if (( $+commands[tsc] )); then
    success-message 'typescript installed'
else
    information-message 'typescript installed'

   npm install -g typescript
fi
