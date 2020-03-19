#!/bin/zsh

if [[ -d $HOME_NPM_PACKAGES ]]; then
	if [[ ! -a $HOME_NPM_PACKAGES_BIN/neovim-node-host ]]; then
		information_message 'installing neovim-node-host'

		npm install -g neovim
	else
		success_message 'neovim-node-host already installed'
	fi
else
	error_message 'npm does not exist'
fi
