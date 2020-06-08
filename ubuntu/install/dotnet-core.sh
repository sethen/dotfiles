#!/bin/zsh

if [[ ! -n $(dpkg --get-selections | grep -w dotnet-sdk-$DOTNET_CORE_VERSION) ]]; then
	information_message "installing dotnet-core"

	MICROSOFT_DEB=packages-microsoft-prod.deb

	wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O $MICROSOFT_DEB
	sudo dpkg -i packages-microsoft-prod.deb
	rm -rf $MICROSOFT_DEB

	sudo apt-get update
	sudo apt-get update
	sudo apt-get install dotnet-sdk-$DOTNET_CORE_VERSION -y
else
	success_message 'dotnet-core already installed'
fi
