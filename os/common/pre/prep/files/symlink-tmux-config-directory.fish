#!/usr/bin/env fish

function symlink-tmux-config-directory
  running-message "symlink-tmux-config-directory"

  ln -sfv $DOTFILES_DIRECTORY/tmux $HOME_CONFIG_DIRECTORY
end
