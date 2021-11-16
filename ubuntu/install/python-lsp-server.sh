#!/bin/zsh

if [[ ! -n $(pip show python-lsp-server) ]]; then
	information_message 'installing python-lsp-server'

	sudo pip install python-lsp-server
	sudo pip install 'python-lsp-server[rope, yapf]'
else
	success_message 'python-lsp-server already installed'
fi
