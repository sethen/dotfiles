#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep nodejs) ]]; then
	information_message 'installing nodejs'

	curl -sL https://deb.nodesource.com/setup_$NODE_VERSION | sudo -E bash -

	sudo apt-get install -y nodejs
else
	success_message 'nodejs installed'
fi
