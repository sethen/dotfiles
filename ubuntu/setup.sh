#!/bin/zsh

information_message "running setup for ${OS}"

if [[ -a "/usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com" ]]; then
	success_message "removing default ubuntu gnome dock"

	sudo rm -rf /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com
fi

if [[ -n $(snap list | grep "gnome-calculator") ]]; then
	success_message "removing snap gnome-calculator"

	sudo snap remove gnome-calculator
fi

if [[ -n $(snap list | grep "gnome-system-monitor") ]]; then
	echo "Icon=gnome-monitor" | sudo tee -a "/var/lib/snapd/desktop/applications/gnome-system-monitor_gnome-system-monitor.desktop"
fi

if [[ ! -n $(dpkg --get-selections | grep "ukuu") ]]; then
	success_message "adding ukuu repository"

	sudo add-apt-repository ppa:teejee2008/ppa -y
fi

if [[ ! -n $(dpkg --get-selections | grep "moka-icon-theme") ]]; then
	success_message "adding moka-icon-theme repository"

	sudo add-apt-repository ppa:moka/daily -y
fi

if [[ ! -n $(type gnomeshell-extension-manage) ]]; then
	success_message "installing gnome extensions manager"

	sudo wget -O /usr/local/bin/gnomeshell-extension-manage "https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage"
	sudo chmod +x /usr/local/bin/gnomeshell-extension-manage

	success_message "installing gnome extensions"

	gnomeshell-extension-manage --install --extension-id 307 --version 3.28 --user &> /dev/null
	gnomeshell-extension-manage --install --extension-id 1228 --version 3.28 --user &> /dev/null
	gnomeshell-extension-manage --install --extension-id 1131 --version 3.28 --user &> /dev/null
	gnomeshell-extension-manage --install --extension-id 1011 --version 3.26 --user &> /dev/null
fi

if [[ ! -n $(type code) ]]; then
	success_message "installing visual-studio-code"

	wget -qO - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
	sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
fi

if [[ ! -n $(dpkg --get-selections | grep "google-chrome-stable") ]]; then
	success_message "installing google-chrome-stable"

	wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
fi

if [[ ! -n $(dpkg --get-selections | grep "spotify-client") ]]; then
	success_message "installing spotify-client"

	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
	sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list'
fi

if [[ ! -n $(dpkg --get-selections | grep "mailspring") ]]; then
	success_message "installing mailspring"

	wget -O mailspring.deb 'https://updates.getmailspring.com/download?platform=linuxDeb'
	sudo dpkg -i mailspring.deb
	rm -rf mailspring*

	echo "Icon=thunderbird" | sudo tee -a "/usr/share/applications/mailspring.desktop"
fi

if [[ ! -n $(ls -la ~/.local/share/applications | grep "appimagekit-bitwarden.desktop") ]]; then
	success_message "installing bit warden"

	wget -O ~/Applications/bitwarden.AppImage "https://vault.bitwarden.com/download/?app=desktop&platform=linux"
	chmod +x ~/Applications/bitwarden.AppImage
	~/Applications/bitwarden.AppImage

	echo "Icon=lastpass" | sudo tee -a ~/.local/share/applications/appimagekit-bitwarden.desktop
fi

if [[ ! -n $(ls -la ~/.local/share/applications | grep "appimagekit-Etcher.desktop") ]]; then
	success_message "installing etcher"

	wget -O ~/Applications/etcher-electron-1.4.4-linux-x64.zip "https://github.com/resin-io/etcher/releases/download/v1.4.4/etcher-electron-1.4.4-linux-x64.zip"
	unzip ~/Applications/etcher-electron-1.4.4-linux-x64.zip -d ~/Applications
	~/Applications/etcher-electron-1.4.4-x86_64.AppImage
	rm -rf ~/Applications/etcher-electron-1.4.4-linux-x64.zip
fi

sudo apt-get install -f

if [[ ! -n $(dpkg --get-selections | grep "nodejs") ]]; then
	curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
	sudo apt-get install -y nodejs
fi

apt_get_install_if_package_not_exists "arc-theme"
apt_get_install_if_package_not_exists "curl"
apt_get_install_if_package_not_exists "ccze"
apt_get_install_if_package_not_exists "git"
apt_get_install_if_package_not_exists "gnome-calculator"
apt_get_install_if_package_not_exists "gnome-shell-extensions"
apt_get_install_if_package_not_exists "gnome-shell-extension-weather"
apt_get_install_if_package_not_exists "gnome-tweaks"
apt_get_install_if_package_not_exists "google-chrome-stable"
apt_get_install_if_package_not_exists "gparted"
apt_get_install_if_package_not_exists "flatpak"
apt_get_install_if_package_not_exists "neovim"
apt_get_install_if_package_not_exists "npm"
apt_get_install_if_package_not_exists "moka-icon-theme"
apt_get_install_if_package_not_exists "pcsxr"
apt_get_install_if_package_not_exists "spotify-client"
apt_get_install_if_package_not_exists "steam"
apt_get_install_if_package_not_exists "ukuu"
apt_get_install_if_package_not_exists "vlc"
apt_get_install_if_package_not_exists "wget"

if [[ ! -n $(type code) ]]; then
	sudo apt-get install code -y
fi

echo ""
read "UPDATEANDUPGRADE?would you like to update and upgrade your packages? [Y/N] "
echo ""

if [[ $UPDATEANDUPGRADE =~ '[Yy]' ]]; then
	success_message "updating apt packages"

	sudo apt update -y

	success_message "upgrading apt packages"

	sudo apt upgrade -y
	sudo apt autoremove -y
fi
