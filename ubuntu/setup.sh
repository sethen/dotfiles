#!/bin/zsh

information_message "running setup"
success_message "installing packages"

apt_get_install_if_package_not_exists "arc-theme"
apt_get_install_if_package_not_exists "chrome-gnome-shell"
apt_get_install_if_package_not_exists "curl"
apt_get_install_if_package_not_exists "ccze"
apt_get_install_if_package_not_exists "gnome-calculator"
apt_get_install_if_package_not_exists "gnome-shell-extension-dashtodock"
apt_get_install_if_package_not_exists "gnome-shell-extensions"
apt_get_install_if_package_not_exists "gnome-shell-extension-weather"
apt_get_install_if_package_not_exists "gnome-tweaks"
apt_get_install_if_package_not_exists "gparted"
apt_get_install_if_package_not_exists "steam"
apt_get_install_if_package_not_exists "vlc"
apt_get_install_if_package_not_exists "wget"