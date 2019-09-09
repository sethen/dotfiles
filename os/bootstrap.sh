#!/bin/zsh

header_message "running bootstrap for os"

if [[ -a $GITCONFIG ]]; then
	ln -sfv $GITCONFIG ~
fi


if [[ -a $GITIGNORE_GLOBAL ]]; then
	ln -sfv $GITIGNORE_GLOBAL ~
fi

if [[ -a $IGNORE ]]; then
	ln -sfv $IGNORE ~
fi

if [[ -a $INITVIM ]]; then
	if [[ ! -d $NVIM_DIRECTORY ]]; then
		mkdir -p $NVIM_DIRECTORY
	fi

	ln -sfv $INITVIM $NVIM_DIRECTORY
fi

if [[ -a $TMUXCONF ]]; then
	ln -sfv $TMUXCONF ~
fi

if [[ -a $OS_ALIASES ]]; then
	information_message "building aliases file"

	if [[ -a $HOME_ALIASES ]]; then
		rm $HOME_ALIASES
		touch $HOME_ALIASES
	fi

	cat $OS_ALIASES > $HOME_ALIASES

	if [[ -a $SPECIFIC_OS_ALIASES ]]; then
		echo "\n" >> $HOME_ALIASES

		cat $SPECIFIC_OS_ALIASES >> $HOME_ALIASES
	fi
fi

if [[ -a $ZSHRC ]]; then
	ln -sfv $ZSHRC ~ && source ~/.zshrc
fi

if [[ ! -a ${DEVELOPER_DIRECTORY} ]]; then
	mkdir ${DEVELOPER_DIRECTORY}
fi

if [[ ! -a ~/.ssh/id_rsa.pub ]]; then
	information_message "creating private/public keys"

	ssh-keygen -t rsa -C "sethenm@gmail.com"
	ssh-add
fi
