#!/bin/zsh

USR_BIN_RG=/usr/bin/rg

if [[ ! -a $USR_BIN_RG ]]; then
	information_message 'installing ripgrep'

	FILENAME=ripgrep-$RIPGREP_VERSION-x86_64-unknown-linux-musl
	FILENAME_TAR=$FILENAME.tar.gz

	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/$RIPGREP_VERSION/$FILENAME_TAR

	tar xf $PRESENT_WORKING_DIRECTORY/$FILENAME_TAR
	sudo cp $FILENAME/rg $USR_BIN_RG && rm -rf $PRESENT_WORKING_DIRECTORY/$FILENAME*
else
	success_message 'ripgrep already installed'
fi
