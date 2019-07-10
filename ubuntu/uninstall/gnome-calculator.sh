#!/bin/zsh

if [[ -n $(snap list | grep "gnome-calculator") ]]; then
	success_message "removing snap gnome-calculator"

	sudo snap remove gnome-calculator
else
	success_message "gnome-calculator already removed"
fi
