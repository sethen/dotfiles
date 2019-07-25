#!/bin/bash

echo ""
echo "welcome to sethen's dotfiles"
echo ""

PRESENT_WORKING_DIRECTORY=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
MANJARO=$(uname -a | grep MANJARO)
UBUNTU=$(cat /etc/lsb-release | grep Ubuntu)
ZSH=$(which zsh)

if [ -n "$MANJARO" ]; then
	export DISTRO='manjaro'

	if [ -z ${ZSH} ]; then
		sudo pacman -S zsh --noconfirm
	fi

	chsh -s /bin/zsh
elif [ -n "$UBUNTU" ]; then
	export DISTRO='ubuntu'

	if [ -z ${ZSH} ]; then
		sudo apt-get install zsh -y
	fi

	chsh -s $(which zsh)
else
	echo "operating system not recognized"

	sleep 3
	exit 1
fi

"${PRESENT_WORKING_DIRECTORY}/os/run.sh"

echo ""
echo "thanks for using sethen's dotfiles for ${DISTRO}"
echo ""
