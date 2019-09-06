#!/bin/zsh

export APPLICATIONS=~/Applications
export FONTS_DIRECTORY=~/.fonts
export LOCAL_SHARE_APPLICATIONS=~/.local/share/applications
export USR_SHARE_APPLICATIONS=/usr/share/applications
export BITWARDEN=${LOCAL_SHARE_APPLICATIONS}/appimagekit-bitwarden.desktop
export MAILSPRING=${USR_SHARE_APPLICATIONS}/mailspring.desktop

check_if_file_exists_executable ${SPECIFIC_OS}/bootstrap.sh
check_if_file_exists_executable ${SPECIFIC_OS}/setup.sh
check_if_file_exists_executable ${SPECIFIC_OS}/preferences.sh
check_if_file_exists_executable ${SPECIFIC_OS}/terminate.sh
