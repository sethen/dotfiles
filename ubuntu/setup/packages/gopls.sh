#!/bin/zsh

if (( $+commands[gopls] )); then
    success-message 'gopls installed'
else
    if [[ -f $GO_BIN ]]; then
	information-message 'installing gopls'

	$GO_BIN install golang.org/x/tools/gopls@latest
    else
	error-message 'golang binary not found'
    fi
fi
