#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep insomnia) ]]; then
	information_message 'adding insomnia repository'

	sudo sh -c "echo 'deb https://dl.bintray.com/getinsomnia/Insomnia /' > /etc/apt/sources.list.d/insomnia.list"

	information_message 'adding insomnia key'

	wget -qO - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
else
	success_message 'insomnia key and repository already added'
fi
