#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep "rvm") ]]; then
	information_message "installing rvm"

	sudo apt-get install -y rvm
	rvm install 2.3.0
	rvm --default use 2.3.0
else
	success_message "rvm already installed"
fi
