#!/bin/zsh

if (( $+commands[gopls] )); then
	success_message "gopls installed"
else
	information_message "installing gopls"

	go install golang.org/x/tools/gopls@latest
fi
