#!/bin/zsh

header_message "running setup for ${DISTRO}"

information_message "uninstalling packages"

${SPECIFIC_OS_UNINSTALL}/empathy.sh
${SPECIFIC_OS_UNINSTALL}/hexchat.sh
${SPECIFIC_OS_UNINSTALL}/libreoffice.sh
${SPECIFIC_OS_UNINSTALL}/lollypop.sh
${SPECIFIC_OS_UNINSTALL}/ms-office.sh

information_message "installing packages"

${SPECIFIC_OS_INSTALL}/base-devel.sh
${SPECIFIC_OS_INSTALL}/yay.sh
${SPECIFIC_OS_INSTALL}/ark-gtk-theme.sh
${SPECIFIC_OS_INSTALL}/bitwarden.sh
${SPECIFIC_OS_INSTALL}/ccze.sh
${SPECIFIC_OS_INSTALL}/curl.sh
${SPECIFIC_OS_INSTALL}/etcher.sh
${SPECIFIC_OS_INSTALL}/git.sh
${SPECIFIC_OS_INSTALL}/golang.sh
${SPECIFIC_OS_INSTALL}/google-chrome.sh
${SPECIFIC_OS_INSTALL}/gpick.sh
${SPECIFIC_OS_INSTALL}/mailspring.sh
${SPECIFIC_OS_INSTALL}/neovim.sh
${SPECIFIC_OS_INSTALL}/npm.sh
${SPECIFIC_OS_INSTALL}/postgresql.sh
${SPECIFIC_OS_INSTALL}/python-pip.sh
${SPECIFIC_OS_INSTALL}/samba.sh
${SPECIFIC_OS_INSTALL}/spotify.sh
${SPECIFIC_OS_INSTALL}/telegram.sh
${SPECIFIC_OS_INSTALL}/visual-studio-code.sh
${SPECIFIC_OS_INSTALL}/vlc.sh

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
