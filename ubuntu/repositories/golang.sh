#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep "golang-go") ]]; then
	information_message "adding golang repository"

	sudo add-apt-repository ppa:longsleep/golang-backports
else
	success_message "golang-go repository already added"
fi
