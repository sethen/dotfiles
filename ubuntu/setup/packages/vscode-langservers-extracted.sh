#!/bin/zsh

if (( $+commands[vscode-html-language-server] )); then
    success-message 'vscode-langservers-extracted installed'
else
    information-message 'installing vscode-langservers-extracted'

    npm install -g vscode-langservers-extracted
fi
