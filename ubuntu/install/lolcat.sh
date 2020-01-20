#!/bin/zsh

if ! type lolcat > /dev/null; then
	information_message 'installing lolcat'

	ZIP_DIRECTORY=$PRESENT_WORKING_DIRECTORY/lolcat.zip
	BIN_DIRECTORY=$PRESENT_WORKING_DIRECTORY/lolcat-master/bin

	sudo wget -O $ZIP_DIRECTORY https://github.com/busyloop/lolcat/archive/master.zip
	unzip $ZIP_DIRECTORY

	cd $BIN_DIRECTORY
	gem install lolcat

	cd $PRESENT_WORKING_DIRECTORY
	rm -rf $PRESENT_WORKING_DIRECTORY/lolcat*
else
	success_message 'lolcat already installed'
fi
