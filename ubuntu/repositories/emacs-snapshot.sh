#!/bin/zsh

if [[ ! -a $APT_SOURCES_DIRECTORY/ubuntu-elisp-ubuntu-ppa-jammy.list ]]; then
	information_message 'adding emacs-snapshot repository'

	sudo add-apt-repository ppa:ubuntu-elisp/ppa
else
	success_message 'emacs-snapshot repository already added'
fi
