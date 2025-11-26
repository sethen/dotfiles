#!/usr/bin/env fish

function symlink-asdf-config-files
  running-message "symlink-asdf-config-files"

  ln -sfv $DOTFILES_CONFIG_DIRECTORY/asdf/.default-gems ~/.default-gems
  ln -sfv $DOTFILES_CONFIG_DIRECTORY/asdf/.tool-versions ~/.tool-versions
end
