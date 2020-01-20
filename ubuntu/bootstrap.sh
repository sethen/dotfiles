#!/bin/zsh

header_message 'ubuntu bootstrap'

UBUNTU_ALIASES=$PRESENT_WORKING_DIRECTORY/ubuntu/.aliases
UBUNTU_ZSH_FUNCTIONS=$PRESENT_WORKING_DIRECTORY/ubuntu/zsh_functions

if [[ -a $UBUNTU_ALIASES ]]; then
	echo "\n" >> ~/.aliases
	cat $UBUNTU_ALIASES >> ~/.aliases
fi

if [[ -d $UBUNTU_ZSH_FUNCTIONS ]]; then
	for os_zsh_function in $UBUNTU_ZSH_FUNCTIONS/*; do
		ln -sfv $os_zsh_function $HOME_ZSH_FUNCTIONS

		FILENAME=$os_zsh_function:t

		echo "autoload -Uz $FILENAME" >> $HOME_ZSHENV
	done
fi

FONTS_DIRECTORY=~/.fonts

if [[ ! -d $FONTS_DIRECTORY ]]; then
	mkdir $FONTS_DIRECTORY
fi

information_message 'copying fonts'

cp -r $PRESENT_WORKING_DIRECTORY/os/fonts/. $FONTS_DIRECTORY

check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/curl.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/git.sh
