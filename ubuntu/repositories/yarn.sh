#!/bin/zsh

if ! type yarn > /dev/null; then
	information_message 'adding yarn repository key'

	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

	information_message 'adding yarn repository'

	echo 'deb https://dl.yarnpkg.com/debian/ stable main' | sudo tee /etc/apt/sources.list.d/yarn.list
else
	success_message 'yarn key and repository already added'
fi
