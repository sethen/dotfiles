#!/bin/zsh

if [[ ! -d $HOME_ZSH_AUTO_SUGGESTIONS ]]; then
	information_message 'configuring zsh-autosuggestions'

	git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME_ZSH_AUTO_SUGGESTIONS}
fi
