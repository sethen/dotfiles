#!/bin/zsh

if ! type buku > /dev/null; then
	information_message "installing buku"

	pip3 install buku
else
	success_message "buku already installed"
fi
