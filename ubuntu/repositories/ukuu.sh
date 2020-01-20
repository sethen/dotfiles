#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep ukuu) ]]; then
	information_message 'adding ukuu repository'

	sudo add-apt-repository ppa:teejee2008/ppa -y
else
	success_message 'ukuu repository already added'
fi
