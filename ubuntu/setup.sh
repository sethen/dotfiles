#!/bin/zsh

information_message "running setup for ${OS}"

if ! dpkg --get-selections | grep "ukuu" &> /dev/null; then
	success_message "adding ukuu repository"

	sudo add-apt-repository ppa:teejee2008/ppa -y
fi

if ! dpkg --get-selections | grep "moka-icon-theme" &> /dev/null; then
	success_message "adding moka-icon-theme repository"

	sudo add-apt-repository ppa:moka/daily -y
fi

if ! type gnomeshell-extension-manage &>/dev/null; then
	success_message "installing gnome extensions manager"

	sudo wget -O /usr/local/bin/gnomeshell-extension-manage "https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage"
	sudo chmod +x /usr/local/bin/gnomeshell-extension-manage

	success_message "installing gnome extensions"

	gnomeshell-extension-manage --install --extension-id 307 --version 3.28 --user &> /dev/null
	gnomeshell-extension-manage --install --extension-id 1228 --version 3.28 --user &> /dev/null
	gnomeshell-extension-manage --install --extension-id 1131 --version 3.28 --user &> /dev/null
	gnomeshell-extension-manage --install --extension-id 1011 --version 3.26 --user &> /dev/null
fi

if ! type code &>/dev/null; then
	success_message "installing visual-studio-code"

	wget -qO - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
	sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
fi

if ! dpkg --get-selections | grep "google-chrome-stable" &> /dev/null; then
	success_message "installing google-chrome-stable"

	wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
fi

if ! dpkg --get-selections | grep "spotify-client" &> /dev/null; then
	success_message "installing spotify-client"

	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
	sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list'
fi

if ! dpkg --get-selections | grep "mailspring" &> /dev/null; then
	success_message "installing mailspring"

	wget -O mailspring.deb 'https://updates.getmailspring.com/download?platform=linuxDeb'
	sudo dpkg -i mailspring.deb
	rm -rf mailspring*
fi

if ! ls -la ~/.local/share/applications | grep "appimagekit-Etcher.desktop" &> /dev/null; then
	success_message "installing etcher"

	wget https://github.com/resin-io/etcher/releases/download/v1.4.4/etcher-electron-1.4.4-linux-x64.zip
	unzip etcher-electron-1.4.4-linux-x64
	./etcher-electron-1.4.4-x86_64.AppImage

	rm -rf ./etcher-electron-1.4.4*
fi

sudo apt-get install -f

success_message "updating apt packages"

sudo apt-get update -y

if ! dpkg --get-selections | grep "nodejs" &> /dev/null; then
	curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
	sudo apt-get install -y nodejs
fi

apt_get_install_if_package_not_exists "arc-theme"
apt_get_install_if_package_not_exists "curl"
apt_get_install_if_package_not_exists "ccze"
apt_get_install_if_package_not_exists "git"
apt_get_install_if_package_not_exists "gnome-shell-extensions"
apt_get_install_if_package_not_exists "gnome-shell-extension-weather"
apt_get_install_if_package_not_exists "gnome-tweaks"
apt_get_install_if_package_not_exists "google-chrome-stable"
apt_get_install_if_package_not_exists "gparted"
apt_get_install_if_package_not_exists "flatpak"
apt_get_install_if_package_not_exists "moka-icon-theme"
apt_get_install_if_package_not_exists "spotify-client"
apt_get_install_if_package_not_exists "steam"
apt_get_install_if_package_not_exists "ukuu"
apt_get_install_if_package_not_exists "vlc"
apt_get_install_if_package_not_exists "wget"

if ! type code &>/dev/null; then
	sudo apt-get install code -y
fi

sudo apt-get upgrade -y
sudo apt-get autoremove -y