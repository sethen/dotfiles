#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep "spotify-client") ]]; then
	success_message "adding spotify-client key"

	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

	success_message "adding spotify-client repository"

	sudo sh -c "echo 'deb http://repository.spotify.com stable non-free' > /etc/apt/sources.list.d/spotify.list"
else
	success_message "spotify key and repository already added"
fi
