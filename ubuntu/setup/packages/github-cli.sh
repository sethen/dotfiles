#!/bin/zsh

apt_get_install_if_package_not_exists gh

local id_pub=$(ls ~/.ssh/id_*.pub)

if [[ ! -n $id_pub ]]; then
	information_message "logging into to github"

	gh auth login

	echo ""
fi
