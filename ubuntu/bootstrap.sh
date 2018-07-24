#!/bin/zsh

information_message "running bootstrap"

if [[ ! -d ~/.fonts ]]; then
    success_message "copying fonts"

	mkdir ~/.fonts

    cp -r "${ZSH_DIRECTORY_PATH}/fonts/." ~/.fonts
fi