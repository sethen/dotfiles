#!/bin/zsh

export APPLICATIONS=~/Applications
export FONTS_DIRECTORY=~/.fonts
export LOCAL_SHARE_APPLICATIONS=~/.local/share/applications
export OS_REPOSITORIES=${SPECIFIC_OS}/repositories
export USR_SHARE_APPLICATIONS=/usr/share/applications
export BITWARDEN=$LOCAL_SHARE_APPLICATIONS/appimagekit-bitwarden.desktop
export MAILSPRING=$USR_SHARE_APPLICATIONS/mailspring.desktop

${SPECIFIC_OS}/bootstrap.sh
${SPECIFIC_OS}/setup.sh
${SPECIFIC_OS}/preferences.sh
${SPECIFIC_OS}/terminate.sh
