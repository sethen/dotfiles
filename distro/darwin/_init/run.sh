#!/bin/zsh

echo ''
header-message "$DISTRO init"
echo ''

FONTS_DIRECTORY=~/Library/Fonts

[ ! -d $FONTS_DIRECTORY ] && mkdir $FONTS_DIRECTORY

information-message 'copying fonts'

cp -r $PRESENT_WORKING_DIRECTORY/assets/fonts/. $FONTS_DIRECTORY

check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/_init/packages/curl.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/_init/packages/git.sh
