#!/bin/zsh

export ALIASES_FILE=~/.aliases
export DEVELOPER_DIRECTORY=~/Developer
export USER=$(whoami)
export VISUAL_STUDIO_CODE_DIRECTORY=~/.config/Code/User
export ZSH_DIRECTORY_PATH=${0:a:h}

"${ZSH_DIRECTORY_PATH}/bootstrap.sh"
"${ZSH_DIRECTORY_PATH}/${OS}/bootstrap.sh"
"${ZSH_DIRECTORY_PATH}/${OS}/setup.sh"
"${ZSH_DIRECTORY_PATH}/repos.sh"
"${ZSH_DIRECTORY_PATH}/${OS}/preferences.sh"
"${ZSH_DIRECTORY_PATH}/${OS}/terminate.sh"