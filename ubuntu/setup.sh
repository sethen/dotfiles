#!/bin/zsh

information_message "running setup for ${OS}"

if [[ ! -n $(dpkg --get-selections | grep "google-chrome-stable") ]]; then
	success_message "adding google-chrome-stable"

	wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c "echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list"
fi

if [[ ! -n $(dpkg --get-selections | grep "insomnia") ]]; then
	success_message "adding insomnia"

	sudo sh -c "echo 'deb https://dl.bintray.com/getinsomnia/Insomnia /' > /etc/apt/sources.list.d/insomnia.list"

	wget -qO - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
fi

if [[ ! -n $(dpkg --get-selections | grep "mailspring") ]]; then
	success_message "adding mailspring"

	wget -O mailspring.deb "https://updates.getmailspring.com/download?platform=linuxDeb"
	sudo dpkg -i mailspring.deb
	rm -rf mailspring*

	echo "Icon=thunderbird" | sudo tee -a "/usr/share/applications/mailspring.desktop"
fi

if [[ ! -n $(dpkg --get-selections | grep "moka-icon-theme") ]]; then
	success_message "adding moka-icon-theme repository"

	sudo add-apt-repository ppa:moka/daily -y
fi

if [[ ! -n $(dpkg --get-selections | grep "neovim") ]]; then
	success_message "adding neovim repository"

	sudo apt-add-repository ppa:neovim-ppa/stable -y
fi

if [[ ! -n $(dpkg --get-selections | grep "nodejs") ]]; then
	curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
	sudo apt-get install -y nodejs
fi

if [[ ! -n $(dpkg --get-selections | grep "spotify-client") ]]; then
	success_message "adding spotify-client"

	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
	sudo sh -c "echo 'deb http://repository.spotify.com stable non-free' > /etc/apt/sources.list.d/spotify.list"
fi

if [[ ! -n $(dpkg --get-selections | grep "ukuu") ]]; then
	success_message "adding ukuu"

	sudo add-apt-repository ppa:teejee2008/ppa -y
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

NEOVIM_AUTOLOAD_DIRECTORY=~/.local/share/nvim/site/autoload

if [[ ! -d $NEOVIM_AUTOLOAD_DIRECTORY ]]; then
	success_message "installing vim plug"

	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [[ -n $(snap list | grep "gnome-calculator") ]]; then
	success_message "removing snap gnome-calculator"

	sudo snap remove gnome-calculator
fi

if [[ -n $(snap list | grep "gnome-system-monitor") ]]; then
	DESKTOP_FILE="/var/lib/snapd/desktop/applications/gnome-system-monitor_gnome-system-monitor.desktop"
	ICON_TEXT="Icon=gnome-monitor"

	if [[ ! -n $(cat $DESKTOP_FILE | grep $ICON_TEXT) ]]; then
		echo "\n$ICON_TEXT" | sudo tee -a $DESKTOP_FILE
	fi
fi

if ! type "gnomeshell-extension-manage" > /dev/null; then
	success_message "installing gnome extensions manager"

	sudo wget -O /usr/local/bin/gnomeshell-extension-manage "https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage"
	sudo chmod +x /usr/local/bin/gnomeshell-extension-manage

	success_message "installing gnome extensions"

	gnomeshell-extension-manage --install --extension-id 307 --version 3.28 --user &> /dev/null
	gnomeshell-extension-manage --install --extension-id 1228 --version 3.28 --user &> /dev/null
	gnomeshell-extension-manage --install --extension-id 1131 --version 3.28 --user &> /dev/null
	gnomeshell-extension-manage --install --extension-id 1011 --version 3.26 --user &> /dev/null
fi

if ! type "code" > /dev/null; then
	success_message "installing visual-studio-code"

	wget -qO - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
	sudo sh -c "echo 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main' > /etc/apt/sources.list.d/vscode.list"

	sudo apt-get install code -y
fi

if [[ -a "/usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com" ]]; then
	success_message "removing default ubuntu gnome dock"

	sudo rm -rf /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com
fi

success_message "updating packages"

sudo apt update -y
sudo apt-get install -f

apt_get_install_if_package_not_exists "arc-theme"
apt_get_install_if_package_not_exists "ccze"
apt_get_install_if_package_not_exists "cmake"
apt_get_install_if_package_not_exists "git"
apt_get_install_if_package_not_exists "gnome-calculator"
apt_get_install_if_package_not_exists "gnome-shell-extensions"
apt_get_install_if_package_not_exists "gnome-shell-extension-weather"
apt_get_install_if_package_not_exists "gnome-tweaks"
apt_get_install_if_package_not_exists "google-chrome-stable"
apt_get_install_if_package_not_exists "gparted"
apt_get_install_if_package_not_exists "gpick"
apt_get_install_if_package_not_exists "default-jre"
apt_get_install_if_package_not_exists "flatpak"
apt_get_install_if_package_not_exists "insomnia"
apt_get_install_if_package_not_exists "neovim"
apt_get_install_if_package_not_exists "nginx"
apt_get_install_if_package_not_exists "moka-icon-theme"
apt_get_install_if_package_not_exists "pcsxr"
apt_get_install_if_package_not_exists "python3"
apt_get_install_if_package_not_exists "python3-pip"
apt_get_install_if_package_not_exists "python-dev"
apt_get_install_if_package_not_exists "spotify-client"
apt_get_install_if_package_not_exists "steam"
apt_get_install_if_package_not_exists "telegram-desktop"
apt_get_install_if_package_not_exists "tmux"
apt_get_install_if_package_not_exists "ukuu"
apt_get_install_if_package_not_exists "virtualenv"
apt_get_install_if_package_not_exists "vlc"
apt_get_install_if_package_not_exists "wget"

echo ""
read "UPGRADE?would you like to upgrade your packages? [Yy/Nn] "
echo ""

if [[ $UPGRADE =~ "[Yy]" ]]; then
	success_message "upgrading apt packages"

	sudo apt upgrade -y
	sudo apt autoremove -y
fi
