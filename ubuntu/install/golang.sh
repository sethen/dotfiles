#!/bin/zsh

function make_go_path_directory() {
	if [ ! -d $DEVELOPER_GO_DIRECTORY ]; then
		mkdir $DEVELOPER_GO_DIRECTORY
		mkdir $DEVELOPER_GO_DIRECTORY/bin
		mkdir $DEVELOPER_GO_DIRECTORY/pkg
		mkdir $DEVELOPER_GO_DIRECTORY/src

		source ~/.zshrc
	fi
}

apt_get_install_if_package_not_exists golang-go make_go_path_directory
