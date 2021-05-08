#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep insomnia) ]]; then
	information_message 'adding insomnia repository'

	echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
else
	success_message 'insomnia repository already added'
fi
