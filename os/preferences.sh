#!/bin/zsh

header_message 'os preferences'

if [[ ! -d $DEVELOPER/wallpapers ]]; then
	read 'GITHUB_SSH?has ssh key been added to github to clone repos? [Yy/Nn] '

	if [[ $GITHUB_SSH =~ '[Yy]' ]]; then
		information_message 'cloning wallpapers repo'

		git clone git@github.com:sethen/wallpapers.git $DEVELOPER/wallpapers
	fi
else
	success_message 'wallpapers repo already cloned'
fi
