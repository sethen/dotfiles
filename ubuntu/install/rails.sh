#!/bin/zsh

if [[ -d $HOME_RBENV_VERSION_BIN ]]; then
	if [[ ! -a $HOME_RBENV_VERSION_BIN/rails ]]; then
		information_message 'installing rails'

		$HOME_RBENV_VERSION_BIN/gem install rails
	else
		success_message 'rails already installed'
	fi
else
	error_message 'ruby version does not exist'
fi
