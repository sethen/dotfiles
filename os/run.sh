#!/bin/zsh

export USER=$(whoami)

# directory locations
export DEVELOPER_DIRECTORY=~/Developer
export OS=${0:a:h}
export DOTFILES=${0:a:h:h}
export NPM_DIRECTORY=~/.npm-global
export NVIM_DIRECTORY=~/.config/nvim

# user
export USER_ALIASES=~/.aliases
export USER_ZSHENV=~/.zshenv
export USER_ZSH_FUNCTIONS=~/.zsh/functions

# os
export OS_ALIASES=${OS}/.aliases
export OS_AVATARS=${OS}/avatars
export OS_FONTS=${OS}/fonts
export OS_INSTALL=${OS}/install
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


if [[ -e $OS_ZSHENV && $SPECIFIC_OS_ZSHENV ]]; then
	if [[ -a $USER_ZSHENV ]]; then
		rm $USER_ZSHENV

		touch $USER_ZSHENV
	fi

	rm -rf $USER_ZSH_FUNCTIONS
	mkdir -p $USER_ZSH_FUNCTIONS

	for general_os_zsh_function in $OS_ZSH_FUNCTIONS/*; do
		ln -sfv $general_os_zsh_function $USER_ZSH_FUNCTIONS
	done

	for specific_os_zsh_function in $SPECIFIC_OS_ZSH_FUNCTIONS/*; do
		ln -sfv $specific_os_zsh_function $USER_ZSH_FUNCTIONS
	done

	cat $OS_ZSHENV > $USER_ZSHENV

	echo "\n" >> $USER_ZSHENV

	cat $SPECIFIC_OS_ZSHENV >> $USER_ZSHENV

	source $USER_ZSHENV
fi

${OS}/bootstrap.sh
${SPECIFIC_OS}/run.sh
${OS}/setup.sh
${OS}/terminate.sh
