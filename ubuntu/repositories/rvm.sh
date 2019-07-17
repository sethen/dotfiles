#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep "rvm") ]]; then
	success_message "adding rvm repository"

	sudo apt-add-repository -y ppa:rael-gc/rvm
else
	success_message "rvm repository already added"
fi

