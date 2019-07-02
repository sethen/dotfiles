#!/bin/zsh

information_message "running setup for ${OS}"

if [[ ! -e "/var/lib/AccountsService/icons/${USER}" ]]; then
	success_message "copying avatar"

	sudo cp "${ZSH_DIRECTORY_PATH}/avatars/anime-sethen.png" "/var/lib/AccountsService/icons/${USER}"
	substitute_icon_name "/var/lib/AccountsService/icons/${USER}" /var/lib/AccountsService/users/${USER}
fi

USR_SHARE_APPLICATIONS=/usr/share/applications

GNOME_CONTROL_CENTER=$USR_SHARE_APPLICATIONS/gnome-control-center.desktop

if [[ -a $GNOME_CONTROL_CENTER ]]; then
	substitute_icon_name "system-settings" $GNOME_CONTROL_CENTER
fi

GNOME_SYSTEM_MONITOR=$USR_SHARE_APPLICATIONS/gnome-system-monitor.desktop

if [[ -a $GNOME_SYSTEM_MONITOR ]]; then
	substitute_icon_name "gnome-monitor" $GNOME_SYSTEM_MONITOR
fi


TERMINAL=$USR_SHARE_APPLICATIONS/org.gnome.Terminal.desktop

if [[ -a $TERMINAL ]]; then
	substitute_icon_name "utilities-terminal" $TERMINAL
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
yay_install_if_package_not_exists "bitwarden"
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

BITWARDEN=$USR_SHARE_APPLICATIONS/bitwarden.desktop

if [[ -a $BITWARDEN ]]; then
	substitute_icon_name "lastpass" $BITWARDEN
fi

MAILSPRING=$USR_SHARE_APPLICATIONS/mailspring.desktop

if [[ -a $MAILSPRING ]]; then
	substitute_icon_name "thunderbird" $MAILSPRING
fi

if [[ ! -n $(pip3 list | grep neovim) ]]; then
	pip3 install --user neovim
fi

nvim +'PlugInstall --sync' +qa

sudo sed -i -- 's/python$/python3/g' /usr/share/gnome-shell/extensions/desk-changer@eric.gach.gmail.com/desk-changer-daemon.py
