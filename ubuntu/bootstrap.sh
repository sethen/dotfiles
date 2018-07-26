#!/bin/zsh

information_message "running bootstrap"

if [[ ! -d ~/.fonts ]]; then
    success_message "copying fonts"

	mkdir ~/.fonts

    cp -r "${ZSH_DIRECTORY_PATH}/fonts/." ~/.fonts
fi

if [[ ! -e "/var/lib/AccountsService/icons/${USER}" ]]; then
    success_message "copying avatar"

    sudo cp "${ZSH_DIRECTORY_PATH}/avatars/anime-sethen.png" "/var/lib/AccountsService/icons/${USER}"
    echo "Icon=/var/lib/AccountsService/icons/${USER}" | sudo tee -a "/var/lib/AccountsService/users/${USER}"
fi