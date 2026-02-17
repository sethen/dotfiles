#!/usr/bin/env fish

function copy-fonts
    running-message copy-fonts

    set -l OMARCHY_FONTS_DIRECTORY ~/.local/share/fonts

    if not test -d $OMARCHY_FONTS_DIRECTORY
        information-message "making fonts directory"

        mkdir -p $OMARCHY_FONTS_DIRECTORY
    end

    information-message "copying fonts"
    cp -r $DOTFILES_DIRECTORY/assets/fonts/. $OMARCHY_FONTS_DIRECTORY
end
