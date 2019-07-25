#!/bin/zsh

header_message "running bootstrap for ${DISTRO}"

if [[ ! -d $FONTS_DIRECTORY ]]; then
	success_message "copying fonts"

	mkdir $FONTS_DIRECTORY

	cp -r $OS_FONTS/. $FONTS_DIRECTORY
fi
