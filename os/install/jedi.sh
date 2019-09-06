#!/bin/zsh

if type 'pip3' > /dev/null; then
	if [[ ! -n $(pip3 list --format=columns | grep jedi) ]]; then
		information_message 'installing jedi'

		pip3 install jedi
	else
		success_message 'jedi is already installed'
	fi
else
	error_message 'pip3 is not installed therefore jedi can not be installed'
fi
