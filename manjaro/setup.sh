#!/bin/zsh

information_message "running setup for ${OS}"

if [[ ! -e "/var/lib/AccountsService/icons/${USER}" ]]; then
	success_message "copying avatar"

	sudo cp "${ZSH_DIRECTORY_PATH}/avatars/anime-sethen.png" "/var/lib/AccountsService/icons/${USER}"
	echo "Icon=/var/lib/AccountsService/icons/${USER}" | sudo tee -a "/var/lib/AccountsService/users/${USER}"
fi

USR_SHARE_APPLICATIONS=/usr/share/applications
BITWARDEN=$USR_SHARE_APPLICATIONS/bitwarden.desktop

if [[ -a $BITWARDEN ]]; then
	success_message "updating settings icon"

	sudo sed -i -- 's/Icon=bitwarden/Icon=lastpass/g' $BITWARDEN
fi

GNOME_CONTROL_CENTER=$USR_SHARE_APPLICATIONS/gnome-control-center.desktop

if [[ -a $GNOME_CONTROL_CENTER ]]; then
	success_message "updating settings icon"

	sudo sed -i -- 's/Icon=org.gnome.Settings/Icon=system-settings/g' $GNOME_CONTROL_CENTER
fi

GNOME_SYSTEM_MONITOR=$USR_SHARE_APPLICATIONS/gnome-system-monitor.desktop

if [[ -a $GNOME_SYSTEM_MONITOR ]]; then
	success_message "updating system monitor icon"

	sudo sed -i -- 's/Icon=org.gnome.SystemMonitor/Icon=gnome-monitor/g' $GNOME_SYSTEM_MONITOR
fi

MAILSPRING=$USR_SHARE_APPLICATIONS/mailspring.desktop

if [[ -a $MAILSPRING ]]; then
	success_message "updating mailspring icon"

	sudo sed -i -- 's/Icon=mailspring/Icon=thunderbird/g' $MAILSPRING
fi

TERMINAL=$USR_SHARE_APPLICATIONS/org.gnome.Terminal.desktop

if [[ -a $TERMINAL ]]; then
	success_message "updating terminal icon"

	sudo sed -i -- 's/Icon=org.gnome.Terminal/Icon=utilities-terminal/g' $TERMINAL
fi

success_message "removing pre-installed packages"

pacman_remove_if_package_exists "empathy"
pacman_remove_if_package_exists "hexchat"
pacman_remove_if_package_exists "libreoffice-fresh"
pacman_remove_if_package_exists "lollypop"
pacman_remove_if_package_exists "ms-office-online"

success_message "installing packages"

if ! pacman -Qi make &> /dev/null; then
	success_message "installing base devel"

	sudo pacman -S base-devel --noconfirm
fi

pacman_install_if_package_not_exists "yay"
yay_install_if_package_not_exists "arc-gtk-theme"
yay_install_if_package_not_exists "curl"
yay_install_if_package_not_exists "ccze"
yay_install_if_package_not_exists "etcher"
yay_install_if_package_not_exists "git"
yay_install_if_package_not_exists "gnome-shell-extension-desk-changer-git"
yay_install_if_package_not_exists "go"
yay_install_if_package_not_exists "google-chrome"
yay_install_if_package_not_exists "gpick"
yay_install_if_package_not_exists "neovim"
yay_install_if_package_not_exists "npm"
yay_install_if_package_not_exists "mailspring"
yay_install_if_package_not_exists "postgresql"
yay_install_if_package_not_exists "python-pip"
yay_install_if_package_not_exists "samba"
yay_install_if_package_not_exists "spotify"
yay_install_if_package_not_exists "telegram-desktop"
yay_install_if_package_not_exists "visual-studio-code-bin"
yay_install_if_package_not_exists "vlc"

if [[ ! -n $(pip3 list | grep neovim) ]]; then
	pip3 install --user neovim
fi

nvim +'PlugInstall --sync' +qa

sudo sed -i -- 's/python$/python3/g' /usr/share/gnome-shell/extensions/desk-changer@eric.gach.gmail.com/desk-changer-daemon.py
