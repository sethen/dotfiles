#!/bin/zsh

if [[ -d $RBENV_VERSION_BIN_DIRECTORY ]]; then
	if [[ ! -a $RBENV_VERSION_BIN_DIRECTORY/tmuxinator ]]; then
		information_message 'installing tmuxinator'

		$RBENV_VERSION_BIN_DIRECTORY/gem install tmuxinator
	else
		success_message 'tmuxinator already installed'
	fi
else
	error_message 'ruby version does not exist'
fi
