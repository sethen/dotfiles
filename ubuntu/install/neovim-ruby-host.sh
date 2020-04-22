#!/bin/zsh

if [[ -d $RBENV_VERSION_BIN_DIRECTORY ]]; then
	if [[ ! -a $RBENV_VERSION_BIN_DIRECTORY/neovim-ruby-host ]]; then
		information_message 'installing neovim-ruby-host'

		$RBENV_VERSION_BIN_DIRECTORY/gem install neovim
	else
		success_message 'neovim-ruby-host already installed'
	fi
else
	error_message 'ruby version does not exist'
fi
