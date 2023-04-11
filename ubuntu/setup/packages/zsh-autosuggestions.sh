#!/bin/zsh

if [[ ! -a $ZSH_AUTOSUGGESTIONS ]]; then
	information_message 'installing zsh-autosuggestions'

	git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUGGESTIONS_DIRECTORY
else
	success_message 'zsh-autosuggestions installed'
fi
