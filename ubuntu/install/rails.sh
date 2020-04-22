#!/bin/zsh

if [[ -d $RBENV_VERSION_BIN_DIRECTORY ]]; then
	if [[ ! -a $RBENV_VERSION_BIN_DIRECTORY/rails ]]; then
		information_message 'installing rails'

		$RBENV_VERSION_BIN_DIRECTORY/gem install rails
	else
		success_message 'rails already installed'
	fi
else
	error_message 'ruby version does not exist'
fi
