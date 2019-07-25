#!/bin/zsh

header_message "running bootstrap for os"

GITCONFIG=$OS/.gitconfig

if [[ -e $GITCONFIG ]]; then
	ln -sfv $GITCONFIG ~
fi

GITIGNORE_GLOBAL=$OS/.gitignore_global

if [[ -e $GITIGNORE_GLOBAL ]]; then
	ln -sfv $GITIGNORE_GLOBAL ~
fi

IGNORE=$OS/.ignore

if [[ -e $IGNORE ]]; then
	ln -sfv $IGNORE ~
fi

INITVIM=$OS/init.vim

if [[ -e $INITVIM ]]; then
	NVIM_DIRECTORY=~/.config/nvim

	if [[ ! -e $NVIM_DIRECTORY ]]; then
		mkdir $NVIM_DIRECTORY
	fi

	ln -sfv $INITVIM $NVIM_DIRECTORY
fi

TMUXCONF=$OS/.tmux.conf

if [[ -e $TMUXCONF ]]; then
	ln -sfv $TMUXCONF ~
fi

if [[ -e $OS_ALIASES ]]; then
	information_message "building aliases file"

	if [[ -a $USER_ALIASES ]]; then
		rm $USER_ALIASES

		touch $USER_ALIASES
	fi

	cat $OS_ALIASES > $USER_ALIASES

	echo "\n" >> $USER_ALIASES

	cat $SPECIFIC_OS_ALIASES >> $USER_ALIASES
fi

ZSHRC=$OS/.zshrc

if [[ -e $ZSHRC ]]; then
	ln -sfv $ZSHRC ~ && source ~/.zshrc
fi

if [[ ! -e ${DEVELOPER_DIRECTORY} ]]; then
	mkdir ${DEVELOPER_DIRECTORY}
fi

if [[ ! -a ~/.ssh/id_rsa.pub ]]; then
	information_message "creating private/public keys"

	ssh-keygen -t rsa -C "sethenm@gmail.com"
	ssh-add
fi
