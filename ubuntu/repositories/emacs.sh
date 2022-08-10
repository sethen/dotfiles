#!/bin/zsh

if [[ ! -a $APT_SOURCES_DIRECTORY/kelleyk-ubuntu-emacs-jammy.list ]]; then
	information_message 'adding emacs repository'

	sudo add-apt-repository ppa:kelleyk/emacs
else
	success_message 'emacs repository already added'
fi
