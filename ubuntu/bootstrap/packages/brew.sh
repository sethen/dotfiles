#!/bin/zsh

if [[ $? != 0 ]] ; then
	information_message "installing brew"

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	success_message "brew already installed"
fi
