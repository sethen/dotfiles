#!/bin/zsh

export PRESENT_WORKING_DIRECTORY="$(cd "$(dirname "$0")"; pwd)"

GLOBALS=$PRESENT_WORKING_DIRECTORY/os/globals.sh

# symlink globals to home and source
ln -sfv $GLOBALS ~
source $GLOBALS

# change shell to zsh
SHELL=$(echo $SHELL)

if [[ ! -n $(echo $SHELL | grep zsh) ]]; then
	WHICH_ZSH=$(which zsh)

	echo "changing shell to $WHICH_ZSH"

	chsh -s $WHICH_ZSH
fi

# determine operating system distro
if type uname > /dev/null; then
	if [[ -n `uname -a | grep 'Ubuntu'` ]]; then
		export DISTRO='ubuntu'
	else
		echo 'operating system not recognized'

		sleep 3
		exit 1
	fi
else
	echo 'operating system could not be determined'
fi

$PRESENT_WORKING_DIRECTORY/os/bootstrap/run.sh
$PRESENT_WORKING_DIRECTORY/$DISTRO/bootstrap/run.sh
$PRESENT_WORKING_DIRECTORY/$DISTRO/setup/run.sh
$PRESENT_WORKING_DIRECTORY/os/preferences.sh
$PRESENT_WORKING_DIRECTORY/$DISTRO/preferences.sh

read "REBOOT?would you like to reboot the system? [Yy/Nn] "

if [[ $REBOOT =~ '[Yy]' ]]; then
	echo "\nrebooting ..."

	sleep 5
	reboot
fi

echo "\nthanks for using sethen's dotfiles\n"
exec zsh
