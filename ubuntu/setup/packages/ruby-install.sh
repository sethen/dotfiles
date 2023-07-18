#!/bin/zsh

RUBY_INSTALL_VERSION=0.9.0
RUBY_INSTALL_DOWNLOAD_DIRECTORY=ruby-install-$RUBY_INSTALL_VERSION

if (( $+commands[ruby-install] )); then
    success-message 'ruby-install installed'
else
    information-message 'installing ruby-install'

    wget -O ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY.tar.gz https://github.com/postmodern/ruby-install/archive/v$RUBY_INSTALL_VERSION.tar.gz
    tar -xzvf ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY.tar.gz -C ~

    cd ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY

    sudo make install

    rm -rf ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY
    rm -rf ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY.tar.gz
fi
