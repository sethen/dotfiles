#!/bin/zsh

if type 'npm' > /dev/null; then
	if ! type 'dockerfile-langserver' > /dev/null; then
		information_message 'installing docker-langserver'

		npm install -g dockerfile-language-server-nodejs
	else
		success_message 'dockerfile-langserver already installed'
	fi
else
	error_message 'npm is not installed therefore dockerfile-langserver can not be installed'
fi
