#!/bin/zsh

if [[ -z $(dconf read /org/gnome/desktop/interface/icon-theme | grep "'Colloid-dark'") ]]; then
    information-message 'cloning colloid icon theme'

    cd $DEVELOPER_DIRECTORY
    git clone git@github.com:vinceliuice/Colloid-icon-theme.git
    cd $DEVELOPER_DIRECTORY/Colloid-icon-theme
    ./install.sh
    rm -rf $DEVELOPER_DIRECTORY/Colloid-icon-theme
else
    success-message 'colloid icon theme installed'
fi
