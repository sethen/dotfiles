#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep "rvm") ]]; then
	information_message "installing rvm"

	sudo apt-get install -y rvm
else
	success_message "rvm already installed"
fi
