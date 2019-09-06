#!/bin/zsh

if type 'rbenv' > /dev/null; then
	if ! type 'rails' > /dev/null; then
		information_message 'installing rails'

		gem install rails
	else
		success_message 'rails already installed'
	fi
else
	error_message 'rbenv is not installed therefore rails can not be installed'
fi
