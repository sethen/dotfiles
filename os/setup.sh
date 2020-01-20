#!/bin/zsh

header_message 'os setup'

check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/os/install/rust.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/os/install/zsh-autosuggestions.sh


if [[ ! -d $DEVELOPER/wallpapers ]]; then
	read 'GITHUB_SSH?has ssh key been added to github to clone repos? [Yy/Nn] '

	if [[ $GITHUB_SSH =~ '[Yy]' ]]; then
		information_message 'cloning wallpapers repo'

		git clone git@github.com:sethen/wallpapers.git $DEVELOPER/wallpapers
	fi
else
	success_message 'wallpapers repo already cloned'
fi
