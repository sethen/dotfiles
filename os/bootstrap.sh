#!/bin/zsh

OS_ALIASES=$PRESENT_WORKING_DIRECTORY/os/.aliases
OS_ZSH_FUNCTIONS=$PRESENT_WORKING_DIRECTORY/os/zsh_functions
OS_ZSHENV=$PRESENT_WORKING_DIRECTORY/os/.zshenv

if [[ -d $HOME_ZSH_FUNCTIONS ]]; then
	rm -rf $HOME_ZSH_FUNCTIONS
fi

mkdir -p $HOME_ZSH_FUNCTIONS

if [[ -a $OS_ZSHENV ]]; then
	cp -f $OS_ZSHENV ~

	echo "\n# os zsh_functions\n" >> $HOME_ZSHENV
else
	echo "$PRESENT_WORKING_DIRECTORY/os/.zshenv is not found"
fi

if [[ -d $OS_ZSH_FUNCTIONS ]]; then
	for os_zsh_function in $OS_ZSH_FUNCTIONS/*; do
		ln -sfv $os_zsh_function $HOME_ZSH_FUNCTIONS

		FILENAME=$os_zsh_function:t

		echo "autoload -Uz $FILENAME" >> $HOME_ZSHENV
	done

	source $HOME_ZSHENV
fi

header_message 'os bootstrap'

if [[ ! -d $DEVELOPER ]]; then
	mkdir -p $DEVELOPER
fi

if [[ ! -d $HOME_CONFIG_NVIM ]]; then
	mkdir -p $HOME_CONFIG_NVIM
fi

symlink_file_to_dest $PRESENT_WORKING_DIRECTORY/os/coc-settings.json $HOME_CONFIG_NVIM
symlink_file_to_dest $PRESENT_WORKING_DIRECTORY/os/init.vim $HOME_CONFIG_NVIM
symlink_file_to_dest $PRESENT_WORKING_DIRECTORY/os/.gitconfig ~
symlink_file_to_dest $PRESENT_WORKING_DIRECTORY/os/.gitignore_global ~
symlink_file_to_dest $PRESENT_WORKING_DIRECTORY/os/.tmux.conf ~
symlink_file_to_dest $PRESENT_WORKING_DIRECTORY/os/.zshrc ~

if [[ -a $HOME_ALIASES ]]; then
	rm $HOME_ALIASES
fi

cp -f $OS_ALIASES ~

if [[ ! -a ~/.ssh/id_rsa.pub ]]; then
	information_message 'creating private/public keys'

	ssh-keygen -t rsa -C 'sethenm@gmail.com'
	ssh-add
fi
