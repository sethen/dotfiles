#!/bin/zsh

if (( $+commands[gopls] )); then
    success_message 'gopls installed'
else
    if [[ -f $GO_BIN ]]; then
	information_message 'installing gopls'

	$GO_BIN install golang.org/x/tools/gopls@latest
    else
	error_message 'golang binary not found'
    fi
fi
