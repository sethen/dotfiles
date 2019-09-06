#!/bin/zsh

export FONTS_DIRECTORY=~/.fonts
export USR_SHARE_APPLICATIONS=/usr/share/applications

check_if_file_exists_executable ${SPECIFIC_OS}/bootstrap.sh
check_if_file_exists_executable ${SPECIFIC_OS}/setup.sh
check_if_file_exists_executable ${SPECIFIC_OS}/preferences.sh
check_if_file_exists_executable ${SPECIFIC_OS}/terminate.sh
