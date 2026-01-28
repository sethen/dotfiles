#!/usr/bin/env fish

function symlink-asdf-config-files
  running-message "symlink-asdf-config-files"

  ln -sfv $DOTFILES_DIRECTORY/asdf/.default-gems ~/.default-gems
end
