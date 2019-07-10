#!/bin/zsh

header_message "running setup for ${OS}"

information_message "uninstalling packages"

${UNINSTALL_DIRECTORY_PATH}/empathy.sh
${UNINSTALL_DIRECTORY_PATH}/hexchat.sh
${UNINSTALL_DIRECTORY_PATH}/libreoffice.sh
${UNINSTALL_DIRECTORY_PATH}/lollypop.sh
${UNINSTALL_DIRECTORY_PATH}/ms-office.sh

information_message "installing packages"

${INSTALL_DIRECTORY_PATH}/base-devel.sh
${INSTALL_DIRECTORY_PATH}/yay.sh
${INSTALL_DIRECTORY_PATH}/ark-gtk-theme.sh
${INSTALL_DIRECTORY_PATH}/bitwarden.sh
${INSTALL_DIRECTORY_PATH}/ccze.sh
${INSTALL_DIRECTORY_PATH}/curl.sh
${INSTALL_DIRECTORY_PATH}/etcher.sh
${INSTALL_DIRECTORY_PATH}/git.sh
${INSTALL_DIRECTORY_PATH}/golang.sh
${INSTALL_DIRECTORY_PATH}/google-chrome.sh
${INSTALL_DIRECTORY_PATH}/gpick.sh
${INSTALL_DIRECTORY_PATH}/mailspring.sh
${INSTALL_DIRECTORY_PATH}/neovim.sh
${INSTALL_DIRECTORY_PATH}/npm.sh
${INSTALL_DIRECTORY_PATH}/postgresql.sh
${INSTALL_DIRECTORY_PATH}/python-pip.sh
${INSTALL_DIRECTORY_PATH}/rust.sh
${INSTALL_DIRECTORY_PATH}/samba.sh
${INSTALL_DIRECTORY_PATH}/spotify.sh
${INSTALL_DIRECTORY_PATH}/telegram.sh
${INSTALL_DIRECTORY_PATH}/visual-studio-code.sh
${INSTALL_DIRECTORY_PATH}/vlc.sh

if [[ ! -n $(pip3 list | grep neovim) ]]; then
	pip3 install --user neovim
fi

echo ""
read "INSTALL_VIM_PLUG_PLUGINS?would you like to install vim-plug plugins? [Yy/Nn] "
echo ""

if [[ $INSTALL_VIM_PLUG_PLUGINS =~ "[Yy]" ]]; then
	information_message "installing vim-plug plugins"

	nvim +'PlugInstall --sync' +qa
fi

sudo sed -i -- 's/python$/python3/g' /usr/share/gnome-shell/extensions/desk-changer@eric.gach.gmail.com/desk-changer-daemon.py
