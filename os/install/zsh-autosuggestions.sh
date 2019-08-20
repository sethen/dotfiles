#!/bin/zsh

if [[ ! -d $USER_ZSH_AUTO_SUGGESTIONS ]]; then
	information_message "configuring zsh-autosuggestions"

	git clone https://github.com/zsh-users/zsh-autosuggestions ${USER_ZSH_AUTO_SUGGESTIONS}
fi
