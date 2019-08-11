#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep "rvm") ]]; then
	information_message "installing rvm"

	sudo apt-get install -y rvm
	rvm install ${RUBY_VERSION}
	rvm --default use ${RUBY_VERSION}
else
	success_message "rvm already installed"
fi
