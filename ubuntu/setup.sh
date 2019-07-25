#!/bin/zsh

header_message "running setup for ${DISTRO}"

information_message "uninstalling packages"

${SPECIFIC_OS_UNINSTALL}/gnome-calculator.sh
${SPECIFIC_OS_UNINSTALL}/ubuntu-gnome-dock.sh

information_message "adding repositories"

${SPECIFIC_OS_REPOSITORIES}/docker.sh
${SPECIFIC_OS_REPOSITORIES}/golang.sh
${SPECIFIC_OS_REPOSITORIES}/google-chrome.sh
${SPECIFIC_OS_REPOSITORIES}/insomnia.sh
${SPECIFIC_OS_REPOSITORIES}/moka-icon-theme.sh
${SPECIFIC_OS_REPOSITORIES}/mono.sh
${SPECIFIC_OS_REPOSITORIES}/neovim.sh
${SPECIFIC_OS_REPOSITORIES}/rvm.sh
${SPECIFIC_OS_REPOSITORIES}/spotify.sh
${SPECIFIC_OS_REPOSITORIES}/ukuu.sh
${SPECIFIC_OS_REPOSITORIES}/visual-studio-code.sh

information_message "updating packages"

sudo apt update -y
sudo apt-get install -f

information_message "installing packages"

${SPECIFIC_OS_INSTALL}/arc-theme.sh
${SPECIFIC_OS_INSTALL}/bitwarden.sh
${SPECIFIC_OS_INSTALL}/ccze.sh
${SPECIFIC_OS_INSTALL}/cmake.sh
${SPECIFIC_OS_INSTALL}/docker.sh
${SPECIFIC_OS_INSTALL}/etcher.sh
${SPECIFIC_OS_INSTALL}/git.sh
${SPECIFIC_OS_INSTALL}/gnome-calculator.sh
${SPECIFIC_OS_INSTALL}/gnome-shell-extension-weather.sh
${SPECIFIC_OS_INSTALL}/gnome-shell-extensions.sh
${SPECIFIC_OS_INSTALL}/gnomeshell-extension-manage.sh
${SPECIFIC_OS_INSTALL}/gnome-tweaks.sh
${SPECIFIC_OS_INSTALL}/golang.sh
${SPECIFIC_OS_INSTALL}/google-chrome.sh
${SPECIFIC_OS_INSTALL}/gparted.sh
${SPECIFIC_OS_INSTALL}/gpick.sh
${SPECIFIC_OS_INSTALL}/insomnia.sh
${SPECIFIC_OS_INSTALL}/jre.sh
${SPECIFIC_OS_INSTALL}/mailspring.sh
${SPECIFIC_OS_INSTALL}/moka-icon-theme.sh
${SPECIFIC_OS_INSTALL}/mono.sh
${SPECIFIC_OS_INSTALL}/neovim.sh
${SPECIFIC_OS_INSTALL}/nginx.sh
${SPECIFIC_OS_INSTALL}/nodejs.sh
${SPECIFIC_OS_INSTALL}/python3.sh
${SPECIFIC_OS_INSTALL}/ripgrep.sh
${SPECIFIC_OS_INSTALL}/rvm.sh
${SPECIFIC_OS_INSTALL}/samba.sh
${SPECIFIC_OS_INSTALL}/spotify.sh
${SPECIFIC_OS_INSTALL}/telegram.sh
${SPECIFIC_OS_INSTALL}/tmux.sh
${SPECIFIC_OS_INSTALL}/ukuu.sh
${SPECIFIC_OS_INSTALL}/vim-plug.sh
${SPECIFIC_OS_INSTALL}/virtualenv.sh
${SPECIFIC_OS_INSTALL}/visual-studio-code.sh
${SPECIFIC_OS_INSTALL}/vlc.sh

echo ""
read "INSTALL_VIM_PLUG_PLUGINS?would you like to install vim-plug plugins? [Yy/Nn] "

if [[ $INSTALL_VIM_PLUG_PLUGINS =~ "[Yy]" ]]; then
	information_message "installing vim-plug plugins"

	nvim +'PlugInstall --sync' +qa
fi

read "UPGRADE?would you like to upgrade your existing packages? [Yy/Nn] "

if [[ $UPGRADE =~ "[Yy]" ]]; then
	information_message "upgrading apt packages"

	sudo apt upgrade -y
	sudo apt autoremove -y
fi

sudo sed -i -- 's/python$/python3/g' ~/.local/share/gnome-shell/extensions/desk-changer@eric.gach.gmail.com/desk-changer-daemon.py
