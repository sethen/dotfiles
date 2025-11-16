#!/usr/bin/env fish

function symlink-neovim-config-directory
  running-message "symlink-neovim-config-directory"

  ln -sfv $DOTFILES_CONFIG_DIRECTORY/nvim $HOME_CONFIG_DIRECTORY
end
