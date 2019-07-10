#!/bin/zsh

export ALIASES_FILE=~/.aliases
export DEVELOPER_DIRECTORY=~/Developer
export USER=$(whoami)
export VISUAL_STUDIO_CODE_DIRECTORY=~/.config/Code/User
export ZSH_DIRECTORY_PATH=${0:a:h}

${ZSH_DIRECTORY_PATH}/bootstrap.sh
${ZSH_DIRECTORY_PATH}/${OS}/run.sh
${ZSH_DIRECTORY_PATH}/terminate.sh
