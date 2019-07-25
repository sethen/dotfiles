#!/bin/zsh

header_message "running setup for ${OS}"

information_message "uninstalling packages"

${OS_UNINSTALL_DIRECTORY_PATH}/gnome-calculator.sh
${OS_UNINSTALL_DIRECTORY_PATH}/ubuntu-gnome-dock.sh

information_message "adding repositories"

${OS_REPOSITORIES_DIRECTORY_PATH}/docker.sh
${OS_REPOSITORIES_DIRECTORY_PATH}/golang.sh
${OS_REPOSITORIES_DIRECTORY_PATH}/google-chrome.sh
${OS_REPOSITORIES_DIRECTORY_PATH}/insomnia.sh
${OS_REPOSITORIES_DIRECTORY_PATH}/moka-icon-theme.sh
${OS_REPOSITORIES_DIRECTORY_PATH}/mono.sh
${OS_REPOSITORIES_DIRECTORY_PATH}/neovim.sh
${OS_REPOSITORIES_DIRECTORY_PATH}/rvm.sh
${OS_REPOSITORIES_DIRECTORY_PATH}/spotify.sh
${OS_REPOSITORIES_DIRECTORY_PATH}/ukuu.sh
${OS_REPOSITORIES_DIRECTORY_PATH}/visual-studio-code.sh

information_message "updating packages"

sudo apt update -y
sudo apt-get install -f

information_message "installing packages"

${OS_INSTALL_DIRECTORY_PATH}/arc-theme.sh
${OS_INSTALL_DIRECTORY_PATH}/bitwarden.sh
${OS_INSTALL_DIRECTORY_PATH}/ccze.sh
${OS_INSTALL_DIRECTORY_PATH}/cmake.sh
${OS_INSTALL_DIRECTORY_PATH}/docker.sh
${OS_INSTALL_DIRECTORY_PATH}/etcher.sh
${OS_INSTALL_DIRECTORY_PATH}/git.sh
${OS_INSTALL_DIRECTORY_PATH}/gnome-calculator.sh
${OS_INSTALL_DIRECTORY_PATH}/gnome-shell-extension-weather.sh
${OS_INSTALL_DIRECTORY_PATH}/gnome-shell-extensions.sh
${OS_INSTALL_DIRECTORY_PATH}/gnomeshell-extension-manage.sh
${OS_INSTALL_DIRECTORY_PATH}/gnome-tweaks.sh
${OS_INSTALL_DIRECTORY_PATH}/golang.sh
${OS_INSTALL_DIRECTORY_PATH}/google-chrome.sh
${OS_INSTALL_DIRECTORY_PATH}/gparted.sh
${OS_INSTALL_DIRECTORY_PATH}/gpick.sh
${OS_INSTALL_DIRECTORY_PATH}/insomnia.sh
${OS_INSTALL_DIRECTORY_PATH}/jre.sh
${OS_INSTALL_DIRECTORY_PATH}/mailspring.sh
${OS_INSTALL_DIRECTORY_PATH}/moka-icon-theme.sh
${OS_INSTALL_DIRECTORY_PATH}/mono.sh
${OS_INSTALL_DIRECTORY_PATH}/neovim.sh
${OS_INSTALL_DIRECTORY_PATH}/nginx.sh
${OS_INSTALL_DIRECTORY_PATH}/nodejs.sh
${OS_INSTALL_DIRECTORY_PATH}/python3.sh
${OS_INSTALL_DIRECTORY_PATH}/ripgrep.sh
${OS_INSTALL_DIRECTORY_PATH}/rvm.sh
${OS_INSTALL_DIRECTORY_PATH}/samba.sh
${OS_INSTALL_DIRECTORY_PATH}/spotify.sh
${OS_INSTALL_DIRECTORY_PATH}/telegram.sh
${OS_INSTALL_DIRECTORY_PATH}/tmux.sh
${OS_INSTALL_DIRECTORY_PATH}/ukuu.sh
${OS_INSTALL_DIRECTORY_PATH}/vim-plug.sh
${OS_INSTALL_DIRECTORY_PATH}/virtualenv.sh
${OS_INSTALL_DIRECTORY_PATH}/visual-studio-code.sh
${OS_INSTALL_DIRECTORY_PATH}/vlc.sh

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
