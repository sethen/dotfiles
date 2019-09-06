#!/bin/zsh

header_message "running setup for ${DISTRO}"

information_message "uninstalling packages"

check_if_file_exists_executable ${SPECIFIC_OS_UNINSTALL}/empathy.sh
check_if_file_exists_executable ${SPECIFIC_OS_UNINSTALL}/hexchat.sh
check_if_file_exists_executable ${SPECIFIC_OS_UNINSTALL}/libreoffice.sh
check_if_file_exists_executable ${SPECIFIC_OS_UNINSTALL}/lollypop.sh
check_if_file_exists_executable ${SPECIFIC_OS_UNINSTALL}/ms-office.sh

information_message "installing packages"

check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/base-devel.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/yay.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/ark-gtk-theme.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/bitwarden.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/ccze.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/curl.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/etcher.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/git.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/golang.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/google-chrome.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/gpick.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/mailspring.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/neovim.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/npm.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/postgresql.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/python-pip.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/samba.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/spotify.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/telegram.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/visual-studio-code.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/vlc.sh

if [[ ! -n $(pip3 list | grep neovim) ]]; then
	pip3 install --user neovim
fi

echo ""
read "VIM_PLUG_PLUGINS?would you like to install vim-plug plugins? [Yy/Nn] "
echo ""

if [[ $VIM_PLUG_PLUGINS =~ "[Yy]" ]]; then
	information_message "installing vim-plug plugins"

	nvim +'PlugInstall --sync' +qa
fi

sudo sed -i -- 's/python$/python3/g' /usr/share/gnome-shell/extensions/desk-changer@eric.gach.gmail.com/desk-changer-daemon.py
