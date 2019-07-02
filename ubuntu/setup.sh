#!/bin/zsh

information_message "running setup for ${OS}"

if [[ ! -e "/var/lib/AccountsService/icons/${USER}" ]]; then
	success_message "copying avatar"

	sudo cp "${ZSH_DIRECTORY_PATH}/avatars/anime-sethen.png" "/var/lib/AccountsService/icons/${USER}"
	substitute_icon_name "/var/lib/AccountsService/icons/${USER}" /var/lib/AccountsService/users/${USER}
fi

if [[ ! -n $(dpkg --get-selections | grep "google-chrome-stable") ]]; then
	success_message "adding google-chrome-stable repository"

	wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c "echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list"
fi

if [[ ! -n $(dpkg --get-selections | grep "insomnia") ]]; then
	success_message "adding insomnia repository"

	wget -qO - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
	sudo sh -c "echo 'deb https://dl.bintray.com/getinsomnia/Insomnia /' > /etc/apt/sources.list.d/insomnia.list"
fi

if [[ ! -n $(dpkg --get-selections | grep "spotify-client") ]]; then
	success_message "adding spotify-client repository"

	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
	sudo sh -c "echo 'deb http://repository.spotify.com stable non-free' > /etc/apt/sources.list.d/spotify.list"
fi

if [[ ! -n $(dpkg --get-selections | grep "docker") ]]; then
	success_message "adding docker repository"

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
fi

if [[ ! -n $(dpkg --get-selections | grep "moka-icon-theme") ]]; then
	success_message "adding moka-icon-theme repository"

	sudo add-apt-repository -u ppa:snwh/ppa
fi

if [[ ! -n $(dpkg --get-selections | grep "neovim") ]]; then
	success_message "adding neovim repository"

	sudo apt-add-repository ppa:neovim-ppa/stable -y
fi

if [[ ! -n $(dpkg --get-selections | grep "ukuu") ]]; then
	success_message "adding ukuu repository"

	sudo add-apt-repository ppa:teejee2008/ppa -y
fi

if ! type "code" > /dev/null; then
	success_message "installing visual-studio-code repository"

	wget -qO - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
	sudo sh -c "echo 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main' > /etc/apt/sources.list.d/vscode.list"
fi

LOCAL_SHARE_APPLICATIONS=~/.local/share/applications
USR_SHARE_APPLICATIONS=/usr/share/applications
BITWARDEN=$LOCAL_SHARE_APPLICATIONS/appimagekit-bitwarden.desktop

if [[ ! -a $BITWARDEN ]]; then
	success_message "installing bit warden"

	wget -O ~/Applications/bitwarden.AppImage "https://vault.bitwarden.com/download/?app=desktop&platform=linux"
	chmod +x ~/Applications/bitwarden.AppImage
	~/Applications/bitwarden.AppImage

	substitute_icon_name "lastpass" $BITWARDEN
else
	substitute_icon_name "lastpass" $BITWARDEN
fi

GNOME_SYSTEM_MONITOR=/var/lib/snapd/desktop/applications/gnome-system-monitor_gnome-system-monitor.desktop

if [[ -a $GNOME_SYSTEM_MONITOR ]]; then
	substitute_icon_name "gnome-system-monitor" $GNOME_SYSTEM_MONITOR
fi

if [[ ! -n $(ls -la ~/.local/share/applications | grep "appimagekit-Etcher.desktop") ]]; then
	success_message "installing etcher"

	wget -O ~/Applications/etcher-electron-1.4.4-linux-x64.zip "https://github.com/resin-io/etcher/releases/download/v1.4.4/etcher-electron-1.4.4-linux-x64.zip"
	unzip ~/Applications/etcher-electron-1.4.4-linux-x64.zip -d ~/Applications
	~/Applications/etcher-electron-1.4.4-x86_64.AppImage
	rm -rf ~/Applications/etcher-electron-1.4.4-linux-x64.zip
fi

MAILSPRING=$USR_SHARE_APPLICATIONS/mailspring.desktop

if [[ ! -a $MAILSPRING ]]; then
	success_message "installing mailspring"

	wget -O mailspring.deb "https://updates.getmailspring.com/download?platform=linuxDeb"
	sudo dpkg -i mailspring.deb
	rm -rf mailspring*

	substitute_icon_name "thunderbird" $MAILSPRING
else
	substitute_icon_name "thunderbird" $MAILSPRING
fi

LIGHTLINE_AUTOLOAD_DIRECTORY=~/.local/share/nvim/plugged/lightline.vim/autoload/lightline/colorscheme
NEOVIM_AUTOLOAD_DIRECTORY=~/.local/share/nvim/site/autoload

if [[ ! -d $NEOVIM_AUTOLOAD_DIRECTORY ]]; then
	success_message "installing vim plug"

	curl -fLo $NEOVIM_AUTOLOAD_DIRECTORY/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [[ ! -n $(dpkg --get-selections | grep "nodejs") ]]; then
	curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
	sudo apt-get install -y nodejs
fi

if [[ ! -a /usr/bin/rg ]]; then
	success_message "installing ripgrep"

	curl -LO "https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz"
	tar xf ripgrep-0.10.0-*.tar.gz
	sudo cp ripgrep-0.10.0-*/rg /usr/bin/rg
	rm -rf ripgrep-0.10.0-*
fi

success_message "install vim-plug plugins"

nvim +'PlugInstall --sync' +qa

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

if [[ -a "/usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com" ]]; then
	success_message "removing default ubuntu gnome dock"

	sudo rm -rf /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com
fi

if [[ -n $(snap list | grep "gnome-calculator") ]]; then
	success_message "removing snap gnome-calculator"

	sudo snap remove gnome-calculator
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
apt_get_install_if_package_not_exists "docker-ce"
apt_get_install_if_package_not_exists "docker-ce-cli"
apt_get_install_if_package_not_exists "flatpak"
apt_get_install_if_package_not_exists "insomnia"
apt_get_install_if_package_not_exists "neovim"
apt_get_install_if_package_not_exists "nginx"
apt_get_install_if_package_not_exists "moka-icon-theme"
apt_get_install_if_package_not_exists "pcsxr"
apt_get_install_if_package_not_exists "python3"
apt_get_install_if_package_not_exists "python3-pip"
apt_get_install_if_package_not_exists "python-dev"
apt_get_install_if_package_not_exists "samba"
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

sudo sed -i -- 's/python$/python3/g' ~/.local/share/gnome-shell/extensions/desk-changer@eric.gach.gmail.com/desk-changer-daemon.py
