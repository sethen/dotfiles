#!/bin/zsh

ZSH_DIRECTORY_ZSH_FUNCTIONS=$ZSH_DIRECTORY_PATH/zsh_functions

if [[ -e $ZSH_DIRECTORY_ZSH_FUNCTIONS ]]; then
	HOME_ZSH_FUNCTIONS_DIRECTORY=~/.zsh/functions
	GLOBAL_HOME_ZSH_FUNCTIONS_DIRECTORY=$HOME_ZSH_FUNCTIONS_DIRECTORY/global
	LOCAL_HOME_ZSH_FUNCTIONS_DIRECTORY=$HOME_ZSH_FUNCTIONS_DIRECTORY/local

	if [[ -d $HOME_ZSH_FUNCTIONS_DIRECTORY ]]; then
		rm -rf $HOME_ZSH_FUNCTIONS_DIRECTORY
	fi

	mkdir -p $GLOBAL_HOME_ZSH_FUNCTIONS_DIRECTORY
	mkdir -p $LOCAL_HOME_ZSH_FUNCTIONS_DIRECTORY

	GLOBAL_DOTFILES_ZSH_FUNCTIONS_DIRECTORY=$ZSH_DIRECTORY_ZSH_FUNCTIONS/global
	LOCAL_DOTFILES_ZSH_FUNCTIONS_DIRECTORY=$ZSH_DIRECTORY_ZSH_FUNCTIONS/local

	for global_function_file in $GLOBAL_DOTFILES_ZSH_FUNCTIONS_DIRECTORY/*; do
		ln -sfv $global_function_file $GLOBAL_HOME_ZSH_FUNCTIONS_DIRECTORY
	done

	for local_function_file in $LOCAL_DOTFILES_ZSH_FUNCTIONS_DIRECTORY/*; do
		ln -sfv $local_function_file $LOCAL_HOME_ZSH_FUNCTIONS_DIRECTORY
	done
fi

if [[ -e "${ZSH_DIRECTORY_PATH}/${OS}/.zshenv" ]]; then
	ln -sfv "${ZSH_DIRECTORY_PATH}/${OS}/.zshenv" ~ && source ~/.zshenv
fi

if [[ -e "${ZSH_DIRECTORY_PATH}/.gitconfig" ]]; then
	ln -sfv "${ZSH_DIRECTORY_PATH}/.gitconfig" ~
fi

if [[ -e "${ZSH_DIRECTORY_PATH}/.gitignore_global" ]]; then
	ln -sfv "${ZSH_DIRECTORY_PATH}/.gitignore_global" ~
fi

if [[ -e "${ZSH_DIRECTORY_PATH}/init.vim" ]]; then
	NVIM_DIRECTORY=~/.config/nvim

	if [[ ! -e $NVIM_DIRECTORY ]]; then
		mkdir $NVIM_DIRECTORY
	fi

	ln -sfv "${ZSH_DIRECTORY_PATH}/init.vim" $NVIM_DIRECTORY
fi

if [[ -e "${ZSH_DIRECTORY_PATH}/.tmux.conf" ]]; then
	ln -sfv "${ZSH_DIRECTORY_PATH}/.tmux.conf" ~
fi

if [[ ! -e ${VISUAL_STUDIO_CODE_DIRECTORY} || ! -e "${VISUAL_STUDIO_CODE_DIRECTORY}/settings.json" ]]; then
	mkdir -p ${VISUAL_STUDIO_CODE_DIRECTORY}

	ln -sfv "${ZSH_DIRECTORY_PATH}/visual-studio-code/settings.json" ${VISUAL_STUDIO_CODE_DIRECTORY}
fi

if [[ -e "${ZSH_DIRECTORY_PATH}/.aliases" ]]; then
	success_message "building ${ALIASES_FILE} file"

	if [[ -a ${ALIASES_FILE} ]]; then
		rm ${ALIASES_FILE}

		touch ${ALIASES_FILE}
	fi

	cat ${ZSH_DIRECTORY_PATH}/.aliases > ${ALIASES_FILE}
	cat ${ZSH_DIRECTORY_PATH}/${OS}/.aliases >> ${ALIASES_FILE}
fi

if [[ ! -e ${DEVELOPER_DIRECTORY} ]]; then
	mkdir ${DEVELOPER_DIRECTORY}
fi

if [[ -e "${ZSH_DIRECTORY_PATH}/.zshrc" ]]; then
	ln -sfv "${ZSH_DIRECTORY_PATH}/.zshrc" ~ && source ~/.zshrc
fi

if [[ ! -a ~/.ssh/id_rsa.pub ]]; then
	success_message "creating private/public keys"

	ssh-keygen -t rsa -C "sethenm@gmail.com"
	ssh-add
fi
