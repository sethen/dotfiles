#!/bin/zsh

header_message "running setup for os"

check_if_file_exists_executable ${OS_INSTALL}/dockerfile-langserver.sh
check_if_file_exists_executable ${OS_INSTALL}/go-langserver.sh
check_if_file_exists_executable ${OS_INSTALL}/goimports.sh
check_if_file_exists_executable ${OS_INSTALL}/gopls.sh
check_if_file_exists_executable ${OS_INSTALL}/jedi.sh
check_if_file_exists_executable ${OS_INSTALL}/rbenv.sh
check_if_file_exists_executable ${OS_INSTALL}/rails.sh
check_if_file_exists_executable ${OS_INSTALL}/rust.sh
check_if_file_exists_executable ${OS_INSTALL}/solargraph.sh
check_if_file_exists_executable ${OS_INSTALL}/vim-plug.sh
check_if_file_exists_executable ${OS_INSTALL}/zsh-autosuggestions.sh

echo ""
read "INSTALL_VIM_PLUG_PLUGINS?would you like to install vim-plug plugins? [Yy/Nn] "

if [[ $INSTALL_VIM_PLUG_PLUGINS =~ "[Yy]" ]]; then
	information_message "installing vim-plug plugins"

	nvim +'PlugInstall --sync' +qa
fi

if [[ ! -d $NPM_DIRECTORY ]]; then
	information_message "configuring npm global modules"

	mkdir $NPM_DIRECTORY
	npm config set prefix $NPM_DIRECTORY

	npm install -g neovim
	npm install -g typescript
fi

COC_SETTINGS=${OS}/coc-settings.json

if [[ -e $COC_SETTINGS ]]; then
	ln -sfv $COC_SETTINGS $NVIM_DIRECTORY
fi

cd ${DEVELOPER_DIRECTORY}

if [[ ! -d "./markdown-include" ]]; then
	read "MARKDOWN_INCLUDE?clone markdown-include repo? [Yy/Nn] "

	if [[ $MARKDOWN_INCLUDE =~ '[Yy]' ]]; then
		information_message "cloning markdown-include repo"

		git clone git@github.com:sethen/markdown-include.git
	fi
fi

if [[ ! -d "./otaclock" ]]; then
	read "OTACLOCK?clone otaclock repo? [Yy/Nn] "

	if [[ $OTACLOCK =~ '[Yy]' ]]; then
		information_message "cloning otaclock repo"

		git clone git@github.com:sethen/otaclock.git
	fi
fi

# Has to be cloned if manjaro OS since it's relied on by desk changer

if [[ ! -d "./wallpapers" ]]; then
	if [[ $OS == 'manjaro' || $OS == 'ubuntu' ]]; then
		information_message "cloning wallpapers repo"

		git clone git@github.com:sethen/wallpapers.git
	else
		read "WALLPAPERS?clone wallpapers repo? [Yy/Nn] "

		if [[ $WALLPAPERS =~ '[Yy]' ]]; then
			information_message "cloning wallpapers repo"

			git clone git@github.com:sethen/wallpapers.git
		fi
	fi
fi
