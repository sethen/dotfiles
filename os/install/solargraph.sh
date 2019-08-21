#!/bin/zsh

if type "rbenv" > /dev/null && ! type "solargraph" > /dev/null; then
	information_message "installing solargraph gem"

	gem install solargraph
else
	success_message "solargraph already installed"
fi

