#!/bin/zsh

CHRUBY_DOWNLOAD_DIRECTORY=chruby-$CHRUBY_VERSION
CHRUBY_SHELL_FILE=/usr/local/share/chruby/chruby.sh
CHRUBY_VERSION=0.3.9

if [[ -f $CHRUBY_SHELL_FILE ]]; then
    success_message 'chruby installed'
else
    information_message 'installing chruby'

    wget -O ~/$CHRUBY_DOWNLOAD_DIRECTORY.tar.gz https://github.com/postmodern/chruby/archive/v$CHRUBY_VERSION.tar.gz
    tar -xvf ~/$CHRUBY_DOWNLOAD_DIRECTORY.tar.gz -C ~

    cd ~/$CHRUBY_DOWNLOAD_DIRECTORY

    sudo make install
    sudo ./scripts/setup.sh

    rm -rf ~/$CHRUBY_DOWNLOAD_DIRECTORY
    rm -rf ~/$CHRUBY_DOWNLOAD_DIRECTORY.tar.gz
fi
