#!/bin/zsh

function add_to_zshrc() {
	echo 'export PATH=~/Developer/go:$PATH' >> ~/.zshrc
}

apt_get_install_if_package_not_exists golang-go add_to_zshrc
