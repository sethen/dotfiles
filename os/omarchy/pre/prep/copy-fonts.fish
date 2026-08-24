#!/usr/bin/env fish

function copy-fonts
    running-message copy-fonts

    set -l OMARCHY_FONTS_DIRECTORY $HOME/.local/share/fonts

    create-directory-if-not-exists $OMARCHY_FONTS_DIRECTORY

    information-message "copying fonts"
    cp -r $DOTFILES_DIRECTORY/assets/fonts/. $OMARCHY_FONTS_DIRECTORY
end
