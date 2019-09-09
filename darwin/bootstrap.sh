#!/bin/zsh

header_message "running bootstrap for ${DISTRO}"

information_message "copying fonts"

cp -r $OS_FONTS/. $FONTS_DIRECTORY
