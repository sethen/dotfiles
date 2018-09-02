#!/bin/zsh

cd ${DEVELOPER_DIRECTORY}

if [[ ! -d "./markdown-include" ]]; then
	read "MARKDOWN_INCLUDE?clone markdown-include repo? [Y/N] "

	if [[ $MARKDOWN_INCLUDE =~ '[Yy]' ]]; then
		success_message "cloning markdown-include repo"

		git clone git@github.com:sethen/markdown-include.git
	fi
fi

if [[ ! -d "./otaclock" ]]; then
	read "OTACLOCK?clone otaclock repo? [Y/N] "

	if [[ $OTACLOCK =~ '[Yy]' ]]; then
		success_message "cloning otaclock repo"

		git clone git@github.com:sethen/otaclock.git
	fi
fi

# Has to be cloned if manjaro OS since it's relied on by desk changer

if [[ ! -d "./wallpapers" && $OS == 'manjaro' ]]; then
	success_message "cloning wallpapers repo"

	git clone git@github.com:sethen/wallpapers.git
elif [[ ! -d "./wallpapers" ]]; then
	read "WALLPAPERS?clone wallpapers repo? [Y/N] "

	if [[ $WALLPAPERS =~ '[Yy]' ]]; then
		success_message "cloning wallpapers repo"

		git clone git@github.com:sethen/wallpapers.git
	fi
fi