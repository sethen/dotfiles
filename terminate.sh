#!/bin/zsh

NPM_DIRECTORY=~/.npm-global

if [[ ! -d $NPM_DIRECTORY ]]; then
	success_message "configuring npm global modules"

	mkdir $NPM_DIRECTORY
	npm config set prefix $NPM_DIRECTORY

	# necessary for youcompleteme to work in neovim
	npm install -g typescript
fi

read "REBOOT?would you like to reboot the system? [Yy/Nn] "

if [[ $REBOOT =~ '[Yy]' ]]; then
	success_message "rebooting..."

	sleep 5
	reboot
fi
