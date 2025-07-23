#!/bin/zsh

echo ''
header-message "$DISTRO init"

# allow open source software installs
# sudo sed -i 's/# deb-src/deb-src/' /etc/apt/sources.list

FONTS_DIRECTORY=~/.fonts

[ ! -d $FONTS_DIRECTORY ] && mkdir $FONTS_DIRECTORY

echo ''
information-message 'copying fonts'

cp -r $PRESENT_WORKING_DIRECTORY/assets/fonts/. $FONTS_DIRECTORY

check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_init/packages/build-essential.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_init/packages/curl.sh
