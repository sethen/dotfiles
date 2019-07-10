#!/bin/zsh

if [[ -a "/usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com" ]]; then
	information_message "removing default ubuntu gnome dock"

	sudo rm -rf /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com
else
	success_message "ubuntu-gnome-dock already removed"
fi
