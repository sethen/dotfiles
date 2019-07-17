#!/bin/zsh

export INSTALL_DIRECTORY_PATH=${ZSH_DIRECTORY_PATH}/${OS}/install
export LOCAL_SHARE_APPLICATIONS=~/.local/share/applications
export OS_DIRECTORY_PATH=${ZSH_DIRECTORY_PATH}/os
export OS_INSTALL_DIRECTORY_PATH=${OS_DIRECTORY_PATH}/install
export REPOSITORIES_DIRECTORY_PATH=${ZSH_DIRECTORY_PATH}/${OS}/repositories
export UNINSTALL_DIRECTORY_PATH=${ZSH_DIRECTORY_PATH}/${OS}/uninstall
export USR_SHARE_APPLICATIONS=/usr/share/applications
export BITWARDEN=$LOCAL_SHARE_APPLICATIONS/appimagekit-bitwarden.desktop
export MAILSPRING=$USR_SHARE_APPLICATIONS/mailspring.desktop

${ZSH_DIRECTORY_PATH}/${OS}/bootstrap.sh
${ZSH_DIRECTORY_PATH}/${OS}/setup.sh
${ZSH_DIRECTORY_PATH}/${OS}/preferences.sh
${ZSH_DIRECTORY_PATH}/${OS}/terminate.sh
