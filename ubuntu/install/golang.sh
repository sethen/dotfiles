#!/bin/zsh

function make_go_path_directory() {
	if [ ! -d $DEVELOPER_GO ]; then
		mkdir $DEVELOPER_GO
		mkdir $DEVELOPER_GO/bin
		mkdir $DEVELOPER_GO/pkg
		mkdir $DEVELOPER_GO/src

		source ~/.zshrc
	fi
}

apt_get_install_if_package_not_exists golang-go make_go_path_directory
