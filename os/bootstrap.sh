#!/bin/zsh

OS_ALIASES=$PRESENT_WORKING_DIRECTORY/os/.aliases
OS_ZSH_FUNCTIONS=$PRESENT_WORKING_DIRECTORY/os/zsh_functions
OS_ZSHENV=$PRESENT_WORKING_DIRECTORY/os/.zshenv

if [[ -d $ZSH_FUNCTIONS_DIRECTORY ]]; then
	rm -rf $ZSH_FUNCTIONS_DIRECTORY
fi

mkdir -p $ZSH_FUNCTIONS_DIRECTORY

if [[ -a $OS_ZSHENV ]]; then
	cp -f $OS_ZSHENV ~

	echo "\n# os zsh_functions\n" >> $ZSHENV
else
	echo "$PRESENT_WORKING_DIRECTORY/os/.zshenv is not found"
fi

if [[ -d $OS_ZSH_FUNCTIONS ]]; then
	for os_zsh_function in $OS_ZSH_FUNCTIONS/*; do
		ln -sfv $os_zsh_function $ZSH_FUNCTIONS_DIRECTORY

		FILENAME=$os_zsh_function:t

		echo "autoload -Uz $FILENAME" >> $ZSHENV
	done

	source $ZSHENV
fi

header_message 'os bootstrap'

if [[ -a $ALIASES ]]; then
	rm $ALIASES
fi

cp -f $OS_ALIASES ~

if [[ ! -d $DEVELOPER_DIRECTORY ]]; then
	mkdir -p $DEVELOPER_DIRECTORY
fi

if [[ ! -d $NPM_PACKAGES_DIRECTORY ]]; then
	mkdir -p $NPM_PACKAGES_DIRECTORY
fi

if [[ ! -d $TMUX_PLUGINS_DIRECTORY ]]; then
	mkdir -p $TMUX_PLUGINS_DIRECTORY
fi

if [[ ! -d $EMACS_DIRECTORY ]]; then
	mkdir -p $EMACS_DIRECTORY
fi

for file in $PRESENT_WORKING_DIRECTORY/os/.emacs.d/*; do
	symlink_file_to_dest $file $EMACS_DIRECTORY
done

symlink_file_to_dest $PRESENT_WORKING_DIRECTORY/os/.gitconfig ~
symlink_file_to_dest $PRESENT_WORKING_DIRECTORY/os/.gitignore_global ~
symlink_file_to_dest $PRESENT_WORKING_DIRECTORY/os/.npmrc ~
symlink_file_to_dest $PRESENT_WORKING_DIRECTORY/os/.tmux.conf ~
symlink_file_to_dest $PRESENT_WORKING_DIRECTORY/os/.zshrc ~

if [[ ! -a ~/.ssh/id_rsa.pub ]]; then
	information_message 'creating private/public keys'

	ssh-keygen -t rsa -C 'sethenm@gmail.com'
	ssh-add
fi
