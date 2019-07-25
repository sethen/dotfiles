#!/bin/zsh

header_message "running bootstrap for ${DISTRO}"

if [[ ! -d $FONTS_DIRECTORY ]]; then
	information_message "copying fonts"

	mkdir $FONTS_DIRECTORY

	cp -r $OS_FONTS/. $FONTS_DIRECTORY
fi

if [[ ! -d $APPLICATIONS ]]; then
	information_message "making Applications directory"

	mkdir $APPLICATIONS
fi

apt_get_install_if_package_not_exists "curl"
apt_get_install_if_package_not_exists "wget"
