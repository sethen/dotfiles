#!/bin/zsh

if ! type "goimports" > /dev/null; then
	information_message "installing goimports"

	go get -u golang.org/x/tools/cmd/goimports
else
	success_message "goimports already installed"
fi
