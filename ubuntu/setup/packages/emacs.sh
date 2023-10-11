#!/bin/zsh

EMACS_DOWNLOAD_DIRECTORY=emacs-$EMACS_VERSION

if (( $+commands[emacs] )); then
    success-message 'emacs installed'
else
    information-message 'installing emacs'

    sudo apt build-dep emacs
    sudo apt install gcc-12 libgccjit0 libgccjit-12-dev -y

    wget -O ~/$EMACS_DOWNLOAD_DIRECTORY.tar.gz https://git.savannah.gnu.org/cgit/emacs.git/snapshot/$EMACS_DOWNLOAD_DIRECTORY.tar.gz
    tar -xvf ~/$EMACS_DOWNLOAD_DIRECTORY.tar.gz -C ~

    cd ~/$EMACS_DOWNLOAD_DIRECTORY

    ./autogen.sh

    CC='gcc-12' ./configure --with-native-compilation --with-tree-sitter 

    make -j$(nproc)
    sudo make install

    rm -rf ~/$EMACS_DOWNLOAD_DIRECTORY
    rm -rf ~/$EMACS_DOWNLOAD_DIRECTORY.tar.gz
fi
