#!/bin/zsh

echo ''
header-message "$DISTRO init"
echo ''

FONTS_DIRECTORY=~/Library/Fonts

[ ! -d $FONTS_DIRECTORY ] && mkdir $FONTS_DIRECTORY

information-message 'copying fonts'

cp -r $PRESENT_WORKING_DIRECTORY/assets/fonts/. $FONTS_DIRECTORY
