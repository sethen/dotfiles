#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep "docker") ]]; then
	information_message "adding docker key"

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

	information_message "adding docker repository"

	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
fi
