#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep "moka-icon-theme") ]]; then
	success_message "adding moka-icon-theme repository"

	sudo add-apt-repository -u ppa:snwh/ppa
else
	success_message "moka-icon-theme repository already added"
fi
