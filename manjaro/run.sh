#!/bin/zsh

export INSTALL_DIRECTORY_PATH=${ZSH_DIRECTORY_PATH}/${OS}/install
export OS_DIRECTORY_PATH=${ZSH_DIRECTORY_PATH}/os
export OS_INSTALL_DIRECTORY_PATH=${OS_DIRECTORY_PATH}/install
export UNINSTALL_DIRECTORY_PATH=${ZSH_DIRECTORY_PATH}/${OS}/uninstall
export USR_SHARE_APPLICATIONS=/usr/share/applications

${ZSH_DIRECTORY_PATH}/${OS}/bootstrap.sh
${ZSH_DIRECTORY_PATH}/${OS}/setup.sh
${ZSH_DIRECTORY_PATH}/${OS}/preferences.sh
${ZSH_DIRECTORY_PATH}/${OS}/terminate.sh
