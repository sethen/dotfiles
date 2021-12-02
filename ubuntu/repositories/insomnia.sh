#!/bin/zsh

if [[ ! -a $APT_SOURCES_DIRECTORY/insomnia.list ]]; then
	information_message 'adding insomnia repository'

	echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
else
	success_message 'insomnia repository already added'
fi
