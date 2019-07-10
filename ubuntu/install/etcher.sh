#!/bin/zsh

ETCHER=$LOCAL_SHARE_APPLICATIONS/appimagekit-Etcher.desktop

if [[ ! -a $ETCHER ]]; then
	information_message "installing etcher"

	APP_IMAGE=~/Applications/etcher-electron-1.4.4-x86_64.AppImage
	ZIP_FILE=~/Applications/etcher-electron-1.4.4-linux-x64.zip
	URL="https://github.com/resin-io/etcher/releases/download/v1.4.4/etcher-electron-1.4.4-linux-x64.zip"

	wget -O $ZIP_FILE $URL
	unzip $ZIP_FILE -d ~/Applications
	rm -rf $ZIP_FILE
	$APP_IMAGE
else
	success_message "etcher is already installed"
fi
