#!/bin/zsh

export ALIASES_FILE=~/.aliases
export DEVELOPER_DIRECTORY=~/Developer
export NPM_DIRECTORY=~/.npm-global
export USER=$(whoami)
export VISUAL_STUDIO_CODE_DIRECTORY=~/.config/Code/User
export ZSH_DIRECTORY_PATH=${0:a:h}
export GLOBAL_OS_DIRECTORY_PATH=${ZSH_DIRECTORY_PATH}/os
export GLOBAL_OS_INSTALL_DIRECTORY_PATH=${GLOBAL_OS_DIRECTORY_PATH}/install
export OS_DIRECTORY_PATH=${ZSH_DIRECTORY_PATH}/${OS}
export OS_INSTALL_DIRECTORY_PATH=${OS_DIRECTORY_PATH}/install
export OS_UNINSTALL_DIRECTORY_PATH=${OS_DIRECTORY_PATH}/uninstall
export ZSH_DIRECTORY_OS_ZSH_FUNCTIONS=$ZSH_DIRECTORY_PATH/$OS/zsh_functions

${GLOBAL_OS_DIRECTORY_PATH}/bootstrap.sh
${OS_DIRECTORY_PATH}/run.sh
${GLOBAL_OS_DIRECTORY_PATH}/setup.sh
${GLOBAL_OS_DIRECTORY_PATH}/terminate.sh
