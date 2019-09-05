#!/bin/zsh

NEOVIM_AUTOLOAD_DIRECTORY=~/.local/share/nvim/site/autoload

if [[ ! -d $NEOVIM_AUTOLOAD_DIRECTORY ]]; then
	information_message "installing vim-plug"

	curl -fLo $NEOVIM_AUTOLOAD_DIRECTORY/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
	success_message "vim-plug already installed"
fi
