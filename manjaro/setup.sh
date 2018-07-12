#!/bin/zsh

information_message "running setup"
success_message "removing pre-installed packages"

pacman_remove_if_package_exists "empathy"
pacman_remove_if_package_exists "hexchat"
pacman_remove_if_package_exists "libreoffice-fresh"
pacman_remove_if_package_exists "lollypop"
pacman_remove_if_package_exists "ms-office-online"
pacman_remove_if_package_exists "firefox"

success_message "installing packages"

pacman_install_if_package_not_exists "yaourt"
yaourt -S base-devel --noconfirm
yaourt_install_if_package_not_exists "arc-gtk-theme"
yaourt_install_if_package_not_exists "curl"
yaourt_install_if_package_not_exists "ccze"
yaourt_install_if_package_not_exists "git"
yaourt_install_if_package_not_exists "gnome-shell-extension-desk-changer-git"
yaourt_install_if_package_not_exists "go"
yaourt_install_if_package_not_exists "google-chrome"
yaourt_install_if_package_not_exists "lastpass"
yaourt_install_if_package_not_exists "npm"
yaourt_install_if_package_not_exists "paper-icon-theme-git"
yaourt_install_if_package_not_exists "postgresql"
yaourt_install_if_package_not_exists "samba"
yaourt_install_if_package_not_exists "spotify"
yaourt_install_if_package_not_exists "visual-studio-code-bin"
yaourt_install_if_package_not_exists "vim"
yaourt_install_if_package_not_exists "vlc"