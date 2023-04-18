#!/bin/zsh

if (( $+commands[solargraph] )); then
	success_message 'solargraph installed'
else
	if [[ -f $RUBY_GEM_BIN ]]; then
		information_message 'installing solargraph'

		$RUBY_GEM_BIN install solargraph
	else
		error_message 'ruby not installed'
	fi
fi
