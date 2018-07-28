#!/bin/zsh

information_message "running setup"
success_message "adding repository keys"

if ! type code &>/dev/null; then
    wget -qO - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
fi

if ! dpkg --get-selections | grep "google-chrome-stable" &> /dev/null; then
    wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
fi

if ! dpkg --get-selections | grep "spotify-client" &> /dev/null; then
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
    sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list'
fi

success_message "adding apt repositories"

if ! dpkg --get-selections | grep "ukuu" &> /dev/null; then
    sudo add-apt-repository ppa:teejee2008/ppa -y
fi

if ! dpkg --get-selections | grep "moka-icon-theme" &> /dev/null; then
    sudo add-apt-repository ppa:moka/daily -y
fi

if ! dpkg --get-selections | grep "nodejs" &> /dev/null; then
    success_message "running nodejs setup"

    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
fi

success_message "installing gnome extensions manager"

sudo wget -O /usr/local/bin/gnomeshell-extension-manage "https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage"
sudo chmod +x /usr/local/bin/gnomeshell-extension-manage

success_message "updating repositories"

sudo apt-get update

success_message "installing apt packages"

apt_get_install_if_package_not_exists "arc-theme"
apt_get_install_if_package_not_exists "chrome-gnome-shell"
apt_get_install_if_package_not_exists "curl"
apt_get_install_if_package_not_exists "ccze"
apt_get_install_if_package_not_exists "code"
apt_get_install_if_package_not_exists "git"
apt_get_install_if_package_not_exists "gnome-calculator"
apt_get_install_if_package_not_exists "gnome-shell-extensions"
apt_get_install_if_package_not_exists "gnome-shell-extension-weather"
apt_get_install_if_package_not_exists "gnome-tweaks"
apt_get_install_if_package_not_exists "google-chrome-stable"
apt_get_install_if_package_not_exists "gparted"
apt_get_install_if_package_not_exists "flatpak"
apt_get_install_if_package_not_exists "nodejs"
apt_get_install_if_package_not_exists "moka-icon-theme"
apt_get_install_if_package_not_exists "spotify-client"
apt_get_install_if_package_not_exists "steam"
apt_get_install_if_package_not_exists "ukuu"
apt_get_install_if_package_not_exists "vlc"
apt_get_install_if_package_not_exists "wget"

success_message "installing gnome extensions"

gnomeshell-extension-manage --install --extension-id 1228 --version 3.28 --user &> /dev/null