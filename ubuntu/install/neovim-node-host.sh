#!/bin/zsh

if [[ -d $NPM_PACKAGES_DIRECTORY ]]; then
	if [[ ! -a $NPM_PACKAGES_BIN_DIRECTORY/neovim-node-host ]]; then
		information_message 'installing neovim-node-host'

		npm install -g neovim
	else
		success_message 'neovim-node-host already installed'
	fi
else
	error_message 'npm does not exist'
fi
