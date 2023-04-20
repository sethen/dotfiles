#!/bin/zsh

if (( $+commands[ruby] )); then
	success_message 'ruby installed'
else
	information_message 'installing ruby'

	ruby-install ruby $RUBY_VERSION
	source $CHRUBY_SHELL_FILE
	chruby $RUBY_VERSION
fi
