#!/bin/zsh

CONFIG_DIRECTORY=~/.config
HOME_ALIASES=~/.aliases
OS_ALIASES=$PRESENT_WORKING_DIRECTORY/os/.aliases
OS_ZSH_FUNCTIONS=$PRESENT_WORKING_DIRECTORY/os/zsh-functions
OS_ZSHENV=$PRESENT_WORKING_DIRECTORY/os/.zshenv

if [[ -a $OS_ZSHENV ]]; then
    cp -f $OS_ZSHENV ~
    . $OS_ZSHENV

    echo "\n# os zsh_functions\n" >> ~/.zshenv
else
    echo "$PRESENT_WORKING_DIRECTORY/os/.zshenv is not found"
fi

if [[ -d $ZSH_FUNCTIONS_DIRECTORY ]]; then
    rm -rf $ZSH_FUNCTIONS_DIRECTORY
fi

mkdir -p $ZSH_FUNCTIONS_DIRECTORY

if [[ -d $OS_ZSH_FUNCTIONS ]]; then
    for os_zsh_function in $OS_ZSH_FUNCTIONS/*; do
	ln -sfv $os_zsh_function $ZSH_FUNCTIONS_DIRECTORY

	FILENAME=$os_zsh_function:t

	echo "autoload -Uz $FILENAME" >> ~/.zshenv
    done

    source ~/.zshenv
fi

echo ''
header-message 'os init'
echo ''

if [[ -a $HOME_ALIASES ]]; then
    rm $HOME_ALIASES
fi

cp -f $OS_ALIASES ~

if [[ ! -d $DEVELOPER_DIRECTORY ]]; then
    mkdir -p $DEVELOPER_DIRECTORY
fi

if [[ ! -d $CONFIG_DIRECTORY ]]; then
    mkdir -p $CONFIG_DIRECTORY
fi

for file in $PRESENT_WORKING_DIRECTORY/os/.config/*; do
    symlink-file-to-dest $file $CONFIG_DIRECTORY
done

symlink-file-to-dest $PRESENT_WORKING_DIRECTORY/os/.gitconfig ~
symlink-file-to-dest $PRESENT_WORKING_DIRECTORY/os/.gitignore_global ~
symlink-file-to-dest $PRESENT_WORKING_DIRECTORY/os/.zshrc ~
