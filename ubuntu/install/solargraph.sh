#!/bin/zsh

if [[ -d $RBENV_VERSION_BIN_DIRECTORY ]]; then
	if [[ ! -a $RBENV_VERSION_BIN_DIRECTORY/solargraph ]]; then
		information_message 'installing solargraph'

		$RBENV_VERSION_BIN_DIRECTORY/gem install solargraph
	else
		success_message 'solargraph already installed'
	fi
else
	error_message 'ruby version does not exist'
fi
