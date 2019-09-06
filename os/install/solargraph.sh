#!/bin/zsh

if type 'rbenv' > /dev/null; then
	if ! type 'solargraph' > /dev/null; then
		information_message 'installing solargraph'

		gem install solargraph
	else
		success_message 'solargraph already installed'
	fi
else
	error_message 'rbenv is not installed therefore solargraph can not be installed'
fi
