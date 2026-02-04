#!/usr/bin/env fish

function copy-fonts
    running-message copy-fonts

    set -l UBUNTU_FONTS_DIRECTORY $HOME/.fonts

    if not test -d $UBUNTU_FONTS_DIRECTORY
        information-message "making fonts directory"

        mkdir -p $UBUNTU_FONTS_DIRECTORY
    end

    information-message "copying fonts"
    cp -r $DOTFILES_DIRECTORY/assets/fonts/. $UBUNTU_FONTS_DIRECTORY
end
