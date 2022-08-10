#!/bin/zsh

if ! type gopls > /dev/null; then
	information_message 'installing gopls'

	go install golang.org/x/tools/gopls@latest
else
	success_message 'gopls already installed'
fi
