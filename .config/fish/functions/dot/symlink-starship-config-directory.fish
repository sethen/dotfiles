#!/bin/fish

function symlink-starship-config-directory
  running-message "symlink-starship-config-directory"

  ln -sfv $DOTFILES_CONFIG_DIRECTORY/starship $HOME_CONFIG_DIRECTORY
end
