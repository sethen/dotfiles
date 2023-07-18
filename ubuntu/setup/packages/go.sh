#!/bin/zsh

GO_DOWNLOAD_DIRECTORY=go-$GO_VERSION

if (( $+commands[go] )); then
    success-message "golang installed"
else
    information-message "installing golang"

    wget -O ~/$GO_DOWNLOAD_DIRECTORY.tar.gz https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz
    sudo tar -xvf ~/$GO_DOWNLOAD_DIRECTORY.tar.gz -C /usr/local

    rm -rf ~/$GO_DOWNLOAD_DIRECTORY.tar.gz
fi
