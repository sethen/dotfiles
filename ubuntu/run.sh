#!/bin/zsh

export FONTS_DIRECTORY=~/.fonts
export LOCAL_SHARE_APPLICATIONS=~/.local/share/applications
export OS_REPOSITORIES_DIRECTORY_PATH=${OS_DIRECTORY_PATH}/repositories
export USR_SHARE_APPLICATIONS=/usr/share/applications
export BITWARDEN=$LOCAL_SHARE_APPLICATIONS/appimagekit-bitwarden.desktop
export MAILSPRING=$USR_SHARE_APPLICATIONS/mailspring.desktop

${OS_DIRECTORY_PATH}/bootstrap.sh
${OS_DIRECTORY_PATH}/setup.sh
${OS_DIRECTORY_PATH}/preferences.sh
${OS_DIRECTORY_PATH}/terminate.sh
