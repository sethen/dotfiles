#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep spotify-client) ]]; then
	information_message 'adding spotify-client key'

	curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -

	information_message 'adding spotify-client repository'

	echo 'deb http://repository.spotify.com stable non-free' | sudo tee /etc/apt/sources.list.d/spotify.list
else
	success_message 'spotify key and repository already added'
fi
