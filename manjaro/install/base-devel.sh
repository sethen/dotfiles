#!/bin/zsh

if ! pacman -Qi make &> /dev/null; then
	success_message "installing base devel"

	sudo pacman -S base-devel --noconfirm
fi
