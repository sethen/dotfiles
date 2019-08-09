#!/bin/zsh

if ! type "gopls" > /dev/null; then
	information_message "installing gopls"

	GO111MODULE=on go get golang.org/x/tools/gopls@latest
else
	success_message "gopls already installed"
fi

