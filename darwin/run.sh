#!/bin/zsh

export FONTS_DIRECTORY=~/Library/Fonts

check_if_file_exists_executable ${SPECIFIC_OS}/bootstrap.sh
check_if_file_exists_executable ${SPECIFIC_OS}/setup.sh
check_if_file_exists_executable ${SPECIFIC_OS}/preferences.sh
