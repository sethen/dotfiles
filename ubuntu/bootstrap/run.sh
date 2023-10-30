#!/bin/zsh


header-message 'ubuntu bootstrap'

# allow open source software installs
sudo sed -i 's/# deb-src/deb-src/' /etc/apt/sources.list


UBUNTU_ALIASES=$PRESENT_WORKING_DIRECTORY/ubuntu/.aliases
UBUNTU_ZSH_FUNCTIONS=$PRESENT_WORKING_DIRECTORY/ubuntu/zsh-functions

if [[ -a $UBUNTU_ALIASES ]]; then
    echo "\n" >> ~/.aliases
    cat $UBUNTU_ALIASES >> ~/.aliases
fi

if [[ -d $UBUNTU_ZSH_FUNCTIONS ]]; then
    information-message 'copying zsh functions'

    for os_zsh_function in $UBUNTU_ZSH_FUNCTIONS/*; do
	ln -sfv $os_zsh_function $ZSH_FUNCTIONS_DIRECTORY

	FILENAME=$os_zsh_function:t

	echo "autoload -Uz $FILENAME" >> ~/.zshenv
    done
fi

FONTS_DIRECTORY=~/.fonts

if [[ ! -d $FONTS_DIRECTORY ]]; then
    mkdir $FONTS_DIRECTORY
fi

information-message 'copying fonts'

cp -r $PRESENT_WORKING_DIRECTORY/os/media/fonts/. $FONTS_DIRECTORY

check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/bootstrap/packages/build-essential.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/bootstrap/packages/curl.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/bootstrap/packages/git.sh
