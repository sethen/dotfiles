#!/bin/zsh

if [[ -d $HOME_RBENV_VERSION_BIN ]]; then
	if [[ ! -a $HOME_RBENV_VERSION_BIN/neovim-ruby-host ]]; then
		information_message 'installing neovim-ruby-host'

		$HOME_RBENV_VERSION_BIN/gem install neovim
	else
		success_message 'neovim-ruby-host already installed'
	fi
else
	error_message 'ruby version does not exist'
fi
