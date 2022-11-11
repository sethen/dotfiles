#!/bin/zsh

if (( $+commands[brew] )); then
	information_message "installing emacs"

	sudo apt build-dep emacs
	sudo apt install gcc-12

	wget -O ~/$EMACS_DOWNLOAD_DIRECTORY.tar.gz http://mirror.keystealth.org/gnu/emacs/$EMACS_DOWNLOAD_DIRECTORY.tar.gz
	tar -xvf ~/$EMACS_DOWNLOAD_DIRECTORY.tar.gz -C ~

	cd ~/$EMACS_DOWNLOAD_DIRECTORY

	CC='gcc-12' ./configure --with-native-compilation \
	  --with-x-toolkit=yes \
	  --with-json

	make -j$(nproc)
	sudo make install

	rm -rf ~/$EMACS_DOWNLOAD_DIRECTORY
	rm -rf ~/$EMACS_DOWNLOAD_DIRECTORY.tar.gz
else
	success_message "emacs installed"
fi
