#!/bin/zsh

if [[ ! -a $BITWARDEN ]]; then
	information_message "installing bitwarden"

	APP_IMAGE=~/Applications/bitwarden.AppImage

	wget -O $APP_IMAGE "https://vault.bitwarden.com/download/?app=desktop&platform=linux"
	chmod +x $APP_IMAGE && $APP_IMAGE
else
	success_message "bitwarden is already installed"
fi
