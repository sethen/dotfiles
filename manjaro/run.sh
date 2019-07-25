#!/bin/zsh

export FONTS_DIRECTORY=~/.fonts
export USR_SHARE_APPLICATIONS=/usr/share/applications

${SPECIFIC_OS}/bootstrap.sh
${SPECIFIC_OS}/setup.sh
${SPECIFIC_OS}/preferences.sh
${SPECIFIC_OS}/terminate.sh
