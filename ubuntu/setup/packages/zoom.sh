#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep -w zoom) ]]; then
    information-message 'installing zoom'

    ZOOM_AMD64=zoom_amd64.deb

    curl -LO https://zoom.us/client/latest/$ZOOM_AMD64
    sudo apt install ./$ZOOM_AMD64 -y
    rm -rf ./$ZOOM_AMD64
else
    success-message 'zoom installed'
fi
