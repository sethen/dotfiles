#!/bin/zsh

header_message "running setup for ${OS}"

information_message "uninstalling packages"

${OS_UNINSTALL_DIRECTORY_PATH}/empathy.sh
${OS_UNINSTALL_DIRECTORY_PATH}/hexchat.sh
${OS_UNINSTALL_DIRECTORY_PATH}/libreoffice.sh
${OS_UNINSTALL_DIRECTORY_PATH}/lollypop.sh
${OS_UNINSTALL_DIRECTORY_PATH}/ms-office.sh

information_message "installing packages"

${OS_INSTALL_DIRECTORY_PATH}/base-devel.sh
${OS_INSTALL_DIRECTORY_PATH}/yay.sh
${OS_INSTALL_DIRECTORY_PATH}/ark-gtk-theme.sh
${OS_INSTALL_DIRECTORY_PATH}/bitwarden.sh
${OS_INSTALL_DIRECTORY_PATH}/ccze.sh
${OS_INSTALL_DIRECTORY_PATH}/curl.sh
${OS_INSTALL_DIRECTORY_PATH}/etcher.sh
${OS_INSTALL_DIRECTORY_PATH}/git.sh
${OS_INSTALL_DIRECTORY_PATH}/golang.sh
${OS_INSTALL_DIRECTORY_PATH}/google-chrome.sh
${OS_INSTALL_DIRECTORY_PATH}/gpick.sh
${OS_INSTALL_DIRECTORY_PATH}/mailspring.sh
${OS_INSTALL_DIRECTORY_PATH}/neovim.sh
${OS_INSTALL_DIRECTORY_PATH}/npm.sh
${OS_INSTALL_DIRECTORY_PATH}/postgresql.sh
${OS_INSTALL_DIRECTORY_PATH}/python-pip.sh
${OS_INSTALL_DIRECTORY_PATH}/samba.sh
${OS_INSTALL_DIRECTORY_PATH}/spotify.sh
${OS_INSTALL_DIRECTORY_PATH}/telegram.sh
${OS_INSTALL_DIRECTORY_PATH}/visual-studio-code.sh
${OS_INSTALL_DIRECTORY_PATH}/vlc.sh

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
