#!/usr/bin/env fish

function copy-fonts
    running-message copy-fonts

    set -l FONTS_DIRECTORY $HOME/.local/share/fonts

    create-directory-if-not-exists $FONTS_DIRECTORY

    information-message "copying fonts"
    cp -r $DOTFILES_DIRECTORY/assets/fonts/. $FONTS_DIRECTORY
end
