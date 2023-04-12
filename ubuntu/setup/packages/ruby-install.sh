#!/bin/zsh

if (( $+commands[ruby-install] )); then
	success_message 'ruby-install installed'
else
	information_message 'installing ruby-install'

	wget -O ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY.tar.gz https://github.com/postmodern/ruby-install/archive/v$RUBY_INSTALL_VERSION.tar.gz
	tar -xzvf ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY.tar.gz -C ~

	cd ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY

	sudo make install

	rm -rf ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY
	rm -rf ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY.tar.gz
fi
