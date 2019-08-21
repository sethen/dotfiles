#!/bin/zsh

if ! type "rails" > /dev/null; then
	information_message "installing rails"

	gem install rails
else
	success_message "rails already installed"
fi

