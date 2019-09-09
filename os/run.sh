#!/bin/zsh

export USER=$(whoami)

# directories
export DEVELOPER_DIRECTORY=~/Developer
export OS=${0:a:h}
export DOTFILES=${0:a:h:h}
export NPM_DIRECTORY=~/.npm-global
export NVIM_DIRECTORY=~/.config/nvim

# home
export HOME_ALIASES=~/.aliases
export HOME_RBENV=~/.rbenv
export HOME_ZSHENV=~/.zshenv
export HOME_ZSH=~/.zsh
export HOME_ZSH_FUNCTIONS=${HOME_ZSH}/functions
export HOME_ZSH_AUTO_SUGGESTIONS=${HOME_ZSH}/zsh-autosuggestions

# os
export OS_ALIASES=${OS}/.aliases
export OS_AVATARS=${OS}/avatars
export OS_FONTS=${OS}/fonts
export OS_INSTALL=${OS}/install
export OS_SCRIPTS=${OS}/scripts
export OS_ZSHENV=${OS}/.zshenv
export OS_ZSH_FUNCTIONS=${OS}/zsh_functions

# specific os
export SPECIFIC_OS=${DOTFILES}/${DISTRO}
export SPECIFIC_OS_ALIASES=${SPECIFIC_OS}/.aliases
export SPECIFIC_OS_INSTALL=${SPECIFIC_OS}/install
export SPECIFIC_OS_REPOSITORIES=${SPECIFIC_OS}/repositories
export SPECIFIC_OS_UNINSTALL=${SPECIFIC_OS}/uninstall
export SPECIFIC_OS_ZSHENV=${SPECIFIC_OS}/.zshenv
export SPECIFIC_OS_ZSH_FUNCTIONS=${SPECIFIC_OS}/zsh_functions

rm -rf $HOME_ZSH_FUNCTIONS
mkdir -p $HOME_ZSH_FUNCTIONS

if [[ -d $OS_ZSH_FUNCTIONS ]]; then
	for general_os_zsh_function in $OS_ZSH_FUNCTIONS/*; do
		ln -sfv $general_os_zsh_function $HOME_ZSH_FUNCTIONS
	done
fi

if [[ -d $SPECIFIC_OS_ZSH_FUNCTIONS ]]; then
	for specific_os_zsh_function in $SPECIFIC_OS_ZSH_FUNCTIONS/*; do
		ln -sfv $specific_os_zsh_function $HOME_ZSH_FUNCTIONS
	done
fi

if [[ -a $OS_ZSHENV ]]; then
	if [[ -a $HOME_ZSHENV ]]; then
		rm $HOME_ZSHENV
		touch $HOME_ZSHENV
	fi

	cat $OS_ZSHENV > $HOME_ZSHENV

	if [[ -a $SPECIFIC_OS_ZSHENV ]]; then
		echo "\n" >> $HOME_ZSHENV

		cat $SPECIFIC_OS_ZSHENV >> $HOME_ZSHENV

		source $HOME_ZSHENV
	fi
fi

check_if_file_exists_executable ${OS}/bootstrap.sh
check_if_file_exists_executable ${SPECIFIC_OS}/run.sh
check_if_file_exists_executable ${OS}/setup.sh
check_if_file_exists_executable ${OS}/terminate.sh
