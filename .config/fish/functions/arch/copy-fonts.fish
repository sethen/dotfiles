#!/usr/bin/env fish

function copy-fonts
  running-message "copy-fonts"

  if not test -d $ARCH_FONTS_DIRECTORY
    information-message "making fonts directory"

    mkdir -p $ARCH_FONTS_DIRECTORY
  end

  information-message "copying fonts"
  cp -r $DOTFILES_DIRECTORY/assets/fonts/. $ARCH_FONTS_DIRECTORY
end
