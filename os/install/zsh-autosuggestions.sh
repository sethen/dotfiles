#!/bin/zsh

HOME_ZSH_AUTO_SUGGESTIONS=~/.zsh/zsh-autosuggestions

if [[ ! -d $HOME_ZSH_AUTO_SUGGESTIONS ]]; then
	information_message 'installing zsh-autosuggestions'

	git clone https://github.com/zsh-users/zsh-autosuggestions $HOME_ZSH_AUTO_SUGGESTIONS
else
	success_message 'zsh-autosuggestions already installed'
fi
