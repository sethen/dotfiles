#!/bin/zsh

if type 'go' > /dev/null; then
	if ! type 'goimports' > /dev/null; then
		information_message 'installing goimports'

		go get -u golang.org/x/tools/cmd/goimports
	else
		success_message 'goimports already installed'
	fi
else
	error_message 'go is not installed therefore goimports can not be installed'
fi
