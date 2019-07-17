#!/bin/zsh

header_message "running terminate"

NPM_DIRECTORY=~/.npm-global

if [[ ! -d $NPM_DIRECTORY ]]; then
	information_message "configuring npm global modules"

	mkdir $NPM_DIRECTORY
	npm config set prefix $NPM_DIRECTORY

	npm install -g neovim
	npm install -g typescript
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

read "REBOOT?would you like to reboot the system? [Yy/Nn] "

if [[ $REBOOT =~ '[Yy]' ]]; then
	success_message "rebooting..."

	sleep 5
	reboot
fi
