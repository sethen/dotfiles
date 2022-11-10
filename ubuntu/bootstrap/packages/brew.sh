#!/bin/zsh
if (( $+commands[brew] )); then
	success_message "brew already installed"
else
	information_message "installing brew"

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
