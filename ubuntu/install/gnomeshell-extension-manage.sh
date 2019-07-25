#!/bin/zsh

if ! type "gnomeshell-extension-manage" > /dev/null; then
	information_message "installing gnomeshell-extension-manage"

	sudo wget -O /usr/local/bin/gnomeshell-extension-manage "https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage"
	sudo chmod +x /usr/local/bin/gnomeshell-extension-manage

	information_message "installing gnome extensions"

	gnomeshell-extension-manage --install --extension-id 307 --version 3.28 --user &> /dev/null
	gnomeshell-extension-manage --install --extension-id 1228 --version 3.28 --user &> /dev/null
	gnomeshell-extension-manage --install --extension-id 1131 --version 3.28 --user &> /dev/null
	gnomeshell-extension-manage --install --extension-id 1011 --version 3.26 --user &> /dev/null
else
	success_message "gnomeshell-extension-manage already installed"
fi