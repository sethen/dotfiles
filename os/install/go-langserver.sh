#!/bin/zsh

if type 'go' > /dev/null; then
	if ! type 'go-langserver' > /dev/null; then
		information_message 'installing go-langserver'

		go get -u github.com/sourcegraph/go-langserver
	else
		success_message 'go-langserver already installed'
	fi
else
	error_message 'go is not installed therefore go-langserver can not be installed'
fi
