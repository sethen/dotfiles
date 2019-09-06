#!/bin/bash

echo ""
echo "welcome to sethen's dotfiles"
echo ""

PRESENT_WORKING_DIRECTORY=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

if type 'uname' > /dev/null; then
	SYSTEM_INFO=$(uname -a)
	ZSH=$(which zsh)

	if echo $SYSTEM_INFO | grep -q 'Darwin'; then
		export DISTRO='darwin'

		echo 'darwin detected'

		BREW=$(which brew)

		if [ -z $BREW ]; then
			/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		fi

		if [ -z $ZSH ]; then
			brew install zsh
		fi
	elif echo $SYSTEM_INFO | grep -q 'MANJARO'; then
		export DISTRO='manjaro'

		echo 'manjaro detected'

		if [ -z $ZSH ]; then
			sudo pacman -S zsh --noconfirm
		fi
	elif echo $SYSTEM_INFO | grep -q 'Ubuntu'; then
		export DISTRO='ubuntu'

		echo 'ubuntu detected'

		if [ -z $ZSH ]; then
			sudo apt-get install zsh -y
		fi
	else
		echo "operating system not recognized"

		sleep 3
		exit 1
	fi

	if echo $SHELL | grep -q 'bash'; then
		echo 'changing shell to zsh'

		sudo chsh -s $ZSH
	fi

	echo ""

	"${PRESENT_WORKING_DIRECTORY}/os/run.sh"

	echo ""
	echo "thanks for using sethen's dotfiles for ${DISTRO}"
	echo ""
else
	echo "operating system could not be determined"
fi
