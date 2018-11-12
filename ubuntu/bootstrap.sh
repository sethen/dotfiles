#!/bin/zsh

information_message "running bootstrap for ${OS}"

ZSH_DIRECTORY_OS_ZSH_FUNCTIONS=$ZSH_DIRECTORY_PATH/$OS/zsh_functions

if [[ -e $ZSH_DIRECTORY_OS_ZSH_FUNCTIONS ]]; then
	HOME_ZSH_FUNCTIONS_DIRECTORY=~/.zsh/functions
	GLOBAL_HOME_ZSH_FUNCTIONS_DIRECTORY=$HOME_ZSH_FUNCTIONS_DIRECTORY/global

	for local_function_file in $ZSH_DIRECTORY_OS_ZSH_FUNCTIONS/*; do
		ln -sfv $local_function_file $GLOBAL_HOME_ZSH_FUNCTIONS_DIRECTORY
	done
fi

FONT_DIRECTORY=~/.fonts

if [[ ! -d $FONT_DIRECTORY ]]; then
	success_message "copying fonts"

	mkdir $FONT_DIRECTORY 

	cp -r "${ZSH_DIRECTORY_PATH}/fonts/." $FONT_DIRECTORY 
fi

if [[ ! -d ~/Applications ]]; then
	success_message "making Applications directory"

	mkdir ~/Applications
fi

if [[ ! -e "/var/lib/AccountsService/icons/${USER}" ]]; then
	success_message "copying avatar"

	sudo cp "${ZSH_DIRECTORY_PATH}/avatars/anime-sethen.png" "/var/lib/AccountsService/icons/${USER}"
	echo "Icon=/var/lib/AccountsService/icons/${USER}" | sudo tee -a "/var/lib/AccountsService/users/${USER}"
fi
