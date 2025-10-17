#!/usr/bin/env fish

function clone-colloid-icon-theme-repo
  running-message "install-colloid-icon-theme-repo"

  if test -z (dconf read /org/gnome/desktop/interface/icon-theme | grep "'Colloid-Dark'")
    information-message "cloning colloid icon theme repo"

    cd $DEVELOPER_DIRECTORY
    git clone git@github.com:vinceliuice/Colloid-icon-theme.git
    cd $DEVELOPER_DIRECTORY/Colloid-icon-theme

    ./install.sh

    rm -rf $DEVELOPER_DIRECTORY/Colloid-icon-theme
  else
    success-message "colloid icon theme repo already cloned"
  end
end
