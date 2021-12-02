#!/bin/zsh

apt_get_install_if_package_not_exists gh

if [[ ! -d ~/.ssh ]]; then
	information_message "logging into to github"

	gh auth login

	echo ""
fi
