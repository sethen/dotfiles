#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep emacs-snapshot) ]]; then
	information_message 'adding emacs-snapshot repository'

	sudo add-apt-repository ppa:ubuntu-elisp/ppa
else
	success_message 'emacs-snapshot repository already added'
fi
