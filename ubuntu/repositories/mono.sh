#!/bin/zsh

if ! type "mono" > /dev/null; then
	information_message "adding mono key"

	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

	information_message "adding mono repository"

	sudo sh -c "echo 'deb https://download.mono-project.com/repo/ubuntu stable-bionic main' > /etc/apt/sources.list.d/mono-official-stable.list"
else
	success_message "moka-icon-theme key and repository already added"
fi
