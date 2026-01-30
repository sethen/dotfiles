#!/usr/bin/env fish

function symlink-mise-config-files
  running-message "symlink-mise-config-files"

  ln -sfv $DOTFILES_DIRECTORY/mise/.default-gems ~/.default-gems
  ln -sfv $DOTFILES_DIRECTORY/mise/mise.toml ~/.config/mise/mise.toml
end
