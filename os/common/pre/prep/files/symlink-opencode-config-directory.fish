#!/usr/bin/env fish

function symlink-opencode-config-directory
  running-message "symlink-opencode-config-directory"

  ln -sfv $DOTFILES_DIRECTORY/opencode $HOME_CONFIG_DIRECTORY
end