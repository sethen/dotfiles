#!/usr/bin/env fish

function copy-fonts
  running-message "copy-fonts"

  if not test -d $DARWIN_FONTS_DIRECTORY
    information-message "creating fonts directory"
    mkdir -p $DARWIN_FONTS_DIRECTORY
  end

  information-message "copying fonts"
  cp -r $DOTFILES_DIRECTORY/assets/fonts/. $DARWIN_FONTS_DIRECTORY
end
