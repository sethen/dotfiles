#!/bin/bash

echo ""
echo "welcome to sethen's dotfiles"
echo ""

export BASH_DIRECTORY_PATH=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

ZSH=$(which zsh)
MANJARO=$(uname -a | grep MANJARO)

if [ -n "$MANJARO" ]; then
	export OS='manjaro'

	if [ -z ${ZSH} ]; then
		sudo pacman -S zsh --noconfirm

		chsh -s $(which zsh)
	fi
else
	echo "operating system not recognized"

	sleep 3
	exit 1
fi

"${BASH_DIRECTORY_PATH}/run.sh"

echo ""
echo "thanks for using sethen's dotfiles"
echo ""