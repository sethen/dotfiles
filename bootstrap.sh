#!/bin/zsh

if [[ -e "${ZSH_DIRECTORY_PATH}/.zsh_functions" ]]; then
	ln -sfv "${ZSH_DIRECTORY_PATH}/.zsh_functions" ~
fi

if [[ -e "${ZSH_DIRECTORY_PATH}/.zshenv" ]]; then
	ln -sfv "${ZSH_DIRECTORY_PATH}/.zshenv" ~ && source ~/.zshenv
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