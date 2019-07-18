#!/bin/zsh

export FONTS_DIRECTORY=~/.fonts
export USR_SHARE_APPLICATIONS=/usr/share/applications

${OS_DIRECTORY_PATH}/bootstrap.sh
${OS_DIRECTORY_PATH}/setup.sh
${OS_DIRECTORY_PATH}/preferences.sh
${OS_DIRECTORY_PATH}/terminate.sh
