#!/bin/zsh

if (( $+commands[tsc] )); then
    success_message 'typescript installed'
else
    information_message 'typescript installed'

   npm install -g typescript
fi
