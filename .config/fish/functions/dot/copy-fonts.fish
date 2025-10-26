#!/bin/fish

function copy-fonts
  running-message "copy-fonts"

  if not test -d $FONTS_DIRECTORY
    information-message "making fonts directory"

    mkdir -p $FONTS_DIRECTORY
  end

  information-message "copying fonts"
  cp -r $DOTFILES_DIRECTORY/assets/fonts/. $FONTS_DIRECTORY
end
