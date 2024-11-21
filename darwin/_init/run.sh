#!/bin/zsh

echo ''
header-message 'darwin init'
echo ''

DARWIN_ALIASES=$PRESENT_WORKING_DIRECTORY/darwin/.aliases
DARWIN_ZSH_FUNCTIONS=$PRESENT_WORKING_DIRECTORY/darwin/zsh-functions

if [[ -a $DARWIN_ALIASES ]]; then
    echo "\n" >> ~/.aliases
    cat $DARWIN_ALIASES >> ~/.aliases
fi

if [[ -d $DARWIN_ZSH_FUNCTIONS ]]; then
    information-message 'copying zsh functions'

    for os_zsh_function in $DARWIN_ZSH_FUNCTIONS/*; do
	ln -sfv $os_zsh_function $ZSH_FUNCTIONS_DIRECTORY

	FILENAME=$os_zsh_function:t

	echo "autoload -Uz $FILENAME" >> ~/.zshenv
    done
fi

FONTS_DIRECTORY=~/Library/Fonts

if [[ ! -d $FONTS_DIRECTORY ]]; then
    mkdir $FONTS_DIRECTORY
fi

echo ''
information-message 'copying fonts'

cp -r $PRESENT_WORKING_DIRECTORY/assets/fonts/. $FONTS_DIRECTORY

check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/darwin/_init/packages/curl.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/darwin/_init/packages/git.sh
