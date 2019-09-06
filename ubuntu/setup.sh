#!/bin/zsh

header_message "running setup for ${DISTRO}"

information_message "uninstalling packages"

check_if_file_exists_executable ${SPECIFIC_OS_UNINSTALL}/gnome-calculator.sh
check_if_file_exists_executable ${SPECIFIC_OS_UNINSTALL}/ubuntu-gnome-dock.sh

information_message "adding repositories"

check_if_file_exists_executable ${SPECIFIC_OS_REPOSITORIES}/docker.sh
check_if_file_exists_executable ${SPECIFIC_OS_REPOSITORIES}/golang.sh
check_if_file_exists_executable ${SPECIFIC_OS_REPOSITORIES}/google-chrome.sh
check_if_file_exists_executable ${SPECIFIC_OS_REPOSITORIES}/insomnia.sh
check_if_file_exists_executable ${SPECIFIC_OS_REPOSITORIES}/moka-icon-theme.sh
check_if_file_exists_executable ${SPECIFIC_OS_REPOSITORIES}/mono.sh
check_if_file_exists_executable ${SPECIFIC_OS_REPOSITORIES}/neovim.sh
check_if_file_exists_executable ${SPECIFIC_OS_REPOSITORIES}/spotify.sh
check_if_file_exists_executable ${SPECIFIC_OS_REPOSITORIES}/ukuu.sh
check_if_file_exists_executable ${SPECIFIC_OS_REPOSITORIES}/yarn.sh
check_if_file_exists_executable ${SPECIFIC_OS_REPOSITORIES}/visual-studio-code.sh

information_message "updating packages"

sudo apt update -y
sudo apt-get install -f

information_message "installing packages"

check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/arc-theme.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/bitwarden.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/ccze.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/cmake.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/docker.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/etcher.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/git.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/gnome-calculator.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/gnome-shell-extension-weather.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/gnome-shell-extensions.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/gnomeshell-extension-manage.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/gnome-tweaks.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/golang.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/google-chrome.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/gparted.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/gpick.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/insomnia.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/jre.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/mailspring.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/moka-icon-theme.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/mono.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/neovim.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/nginx.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/nodejs.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/python3.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/ripgrep.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/samba.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/spotify.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/telegram.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/tmux.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/ukuu.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/virtualenv.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/visual-studio-code.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/vlc.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/xsel.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/yarn.sh

read "UPGRADE?would you like to upgrade your existing packages? [Yy/Nn] "

if [[ $UPGRADE =~ "[Yy]" ]]; then
	information_message "upgrading apt packages"

	sudo apt upgrade -y
	sudo apt autoremove -y
fi

sudo sed -i -- 's/python$/python3/g' ~/.local/share/gnome-shell/extensions/desk-changer@eric.gach.gmail.com/desk-changer-daemon.py
