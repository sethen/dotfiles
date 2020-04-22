#!/bin/zsh

if [[ ! -a $TPM ]]; then
	information_message 'installing tmux plugin manager'

	git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGINS_DIRECTORY
else
	success_message 'tmux plugin manager already installed'
fi
