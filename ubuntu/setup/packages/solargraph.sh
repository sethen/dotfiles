#!/bin/zsh

if (( $+commands[solargraph] )); then
	success_message 'solargraph installed'
else
	information_message 'installing solargraph'

	gem install solargraph
fi
