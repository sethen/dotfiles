#!/bin/zsh

if [[ ! -n $(pip3 list --format=columns | grep jedi) ]]; then
	information_message "installing jedi"

	pip3 install jedi
else
	success_message "jedi is already installed"
fi
