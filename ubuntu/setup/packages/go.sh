#!/bin/zsh

if (( $+commands[go] )); then
	success_message "golang installed"
else
	information_message "installing golang"

	sudo wget -O ~/$GO_DOWNLOAD_DIRECTORY.tar.gz https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz
	sudo tar -xvf ~/$GO_DOWNLOAD_DIRECTORY.tar.gz -C /usr/local

	rm -rf ~/$GO_DOWNLOAD_DIRECTORY.tar.gz
fi
