#!/bin/zsh

header_message "running setup for ${OS}"

information_message "uninstalling packages"

${UNINSTALL_DIRECTORY_PATH}/gnome-calculator.sh
${UNINSTALL_DIRECTORY_PATH}/ubuntu-gnome-dock.sh

information_message "adding repositories"

${REPOSITORIES_DIRECTORY_PATH}/docker.sh
${REPOSITORIES_DIRECTORY_PATH}/golang.sh
${REPOSITORIES_DIRECTORY_PATH}/google-chrome.sh
${REPOSITORIES_DIRECTORY_PATH}/insomnia.sh
${REPOSITORIES_DIRECTORY_PATH}/moka-icon-theme.sh
${REPOSITORIES_DIRECTORY_PATH}/mono.sh
${REPOSITORIES_DIRECTORY_PATH}/neovim.sh
${REPOSITORIES_DIRECTORY_PATH}/spotify.sh
${REPOSITORIES_DIRECTORY_PATH}/ukuu.sh
${REPOSITORIES_DIRECTORY_PATH}/visual-studio-code.sh

information_message "updating packages"

sudo apt update -y
sudo apt-get install -f

information_message "installing packages"

${INSTALL_DIRECTORY_PATH}/arc-theme.sh
${INSTALL_DIRECTORY_PATH}/bitwarden.sh
${INSTALL_DIRECTORY_PATH}/ccze.sh
${INSTALL_DIRECTORY_PATH}/cmake.sh
${INSTALL_DIRECTORY_PATH}/docker.sh
${INSTALL_DIRECTORY_PATH}/etcher.sh
${INSTALL_DIRECTORY_PATH}/git.sh
${INSTALL_DIRECTORY_PATH}/gnome-calculator.sh
${INSTALL_DIRECTORY_PATH}/gnome-shell-extension-weather.sh
${INSTALL_DIRECTORY_PATH}/gnome-shell-extensions.sh
${INSTALL_DIRECTORY_PATH}/gnomeshell-extension-manage.sh
${INSTALL_DIRECTORY_PATH}/gnome-tweaks.sh
${INSTALL_DIRECTORY_PATH}/golang.sh
${INSTALL_DIRECTORY_PATH}/google-chrome.sh
${INSTALL_DIRECTORY_PATH}/gparted.sh
${INSTALL_DIRECTORY_PATH}/gpick.sh
${INSTALL_DIRECTORY_PATH}/insomnia.sh
${INSTALL_DIRECTORY_PATH}/jre.sh
${INSTALL_DIRECTORY_PATH}/mailspring.sh
${INSTALL_DIRECTORY_PATH}/moka-icon-theme.sh
${INSTALL_DIRECTORY_PATH}/mono.sh
${INSTALL_DIRECTORY_PATH}/neovim.sh
${INSTALL_DIRECTORY_PATH}/nginx.sh
${INSTALL_DIRECTORY_PATH}/nodejs.sh
${INSTALL_DIRECTORY_PATH}/python3.sh
${INSTALL_DIRECTORY_PATH}/ripgrep.sh
${INSTALL_DIRECTORY_PATH}/rust.sh
${INSTALL_DIRECTORY_PATH}/samba.sh
${INSTALL_DIRECTORY_PATH}/spotify.sh
${INSTALL_DIRECTORY_PATH}/telegram.sh
${INSTALL_DIRECTORY_PATH}/tmux.sh
${INSTALL_DIRECTORY_PATH}/ukuu.sh
${INSTALL_DIRECTORY_PATH}/vim-plug.sh
${INSTALL_DIRECTORY_PATH}/virtualenv.sh
${INSTALL_DIRECTORY_PATH}/visual-studio-code.sh
${INSTALL_DIRECTORY_PATH}/vlc.sh

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
