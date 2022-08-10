#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep docker) ]]; then
	information_message 'adding docker key'

	if [[ ! -d $ETC_APT_KEYRINGS_DIRECTORY ]]; then
		sudo mkdir -p $ETC_APT_KEYRINGS_DIRECTORY
	fi

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

	information_message 'adding docker repository'

	echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
else
	success_message 'docker key and repository already added'
fi
