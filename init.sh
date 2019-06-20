#!/bin/bash

echo ""
echo "welcome to sethen's dotfiles"
echo ""

export BASH_DIRECTORY_PATH=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

ZSH=$(which zsh)
MANJARO=$(uname -a | grep MANJARO)
UBUNTU=$(cat /etc/lsb-release | grep Ubuntu)

if [ -n "$MANJARO" ]; then
	export OS='manjaro'

	if [ -z ${ZSH} ]; then
		sudo pacman -S zsh --noconfirm
	fi

	chsh -s /bin/zsh
elif [ -n "$UBUNTU" ]; then
	export OS='ubuntu'

	if [ -z ${ZSH} ]; then
		sudo apt-get install curl -y
		sudo apt-get install zsh -y
	fi

	chsh -s $(which zsh)
else
	echo "operating system not recognized"

	sleep 3
	exit 1
fi

"${BASH_DIRECTORY_PATH}/run.sh"

echo ""
echo "thanks for using sethen's dotfiles for ${OS}"
echo ""

"${BASH_DIRECTORY_PATH}/terminate.sh"
