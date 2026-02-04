#!/usr/bin/env fish

function clone-white-sur-icon-theme-repo
    running-message install-white-sur-icon-theme-repo

    if test -z (dconf read /org/gnome/desktop/interface/icon-theme | grep "'WhiteSur-dark'")
        information-message "cloning white sur icon theme repo"

        cd $DEVELOPER_DIRECTORY
        git clone git@github.com:vinceliuice/WhiteSur-icon-theme.git
        cd $DEVELOPER_DIRECTORY/WhiteSur-icon-theme

        ./install.sh

        rm -rf $DEVELOPER_DIRECTORY/WhiteSur-icon-theme
    else
        success-message "white sur icon theme repo already cloned"
    end
end
