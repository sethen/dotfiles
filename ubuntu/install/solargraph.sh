#!/bin/zsh

if [[ -d $HOME_RBENV_VERSION_BIN ]]; then
	if [[ ! -a $HOME_RBENV_VERSION_BIN/solargraph ]]; then
		information_message 'installing solargraph'

		$HOME_RBENV_VERSION_BIN/gem install solargraph
	else
		success_message 'solargraph already installed'
	fi
else
	error_message 'ruby version does not exist'
fi
