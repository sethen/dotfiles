#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep neovim) ]]; then
	information_message 'adding neovim repository'

	sudo apt-add-repository ppa:neovim-ppa/stable -y
else
	success_message 'neovim repository already added'
fi
