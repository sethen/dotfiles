#!/bin/zsh

information_message "running setup"
success_message "adding repository keys"

wget -qO - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'

success_message "adding apt repositories"

sudo add-apt-repository ppa:teejee2008/ppa -y
sudo add-apt-repository ppa:moka/daily -y

success_message "running nodejs setup"

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

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
apt_get_install_if_package_not_exists "moka-icon-theme"
apt_get_install_if_package_not_exists "steam"
apt_get_install_if_package_not_exists "ukuu"
apt_get_install_if_package_not_exists "vlc"
apt_get_install_if_package_not_exists "wget"
apt_get_install_if_package_not_exists "nodejs"

success_message "installing snap packages"

sudo snap install spotify