#!/bin/zsh

if [[ -d $NPM_PACKAGES_DIRECTORY ]]; then
	if [[ ! -a $NPM_PACKAGES_BIN_DIRECTORY/tsc ]]; then
		information_message 'installing typescript'

		npm install -g typescript typescript-language-server
	else
		success_message 'typescript already installed'
	fi
else
	error_message 'npm does not exist'
fi
