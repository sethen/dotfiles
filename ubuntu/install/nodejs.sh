#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep nodejs) ]]; then
	information_message 'installing nodejs'

	curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -

	sudo apt-get install -y nodejs
else
	success_message 'nodejs already installed'
fi
