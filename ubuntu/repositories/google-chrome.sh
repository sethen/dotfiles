#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep google-chrome-stable) ]]; then
	information_message 'adding google-chrome-stable key'

	wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

	information_message 'adding google-chrome-stable repository'

	sudo sh -c "echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list"
else
	success_message 'google-chrome-stable key and repository already added'
fi
