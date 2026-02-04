#!/usr/bin/env fish

function make-tmux-directory
  running-message "make-tmux-directory"

  set -l HOME_TMUX_DIRECTORY $HOME_CONFIG_DIRECTORY/tmux

  if not test -d $HOME_TMUX_DIRECTORY
    information-message "making tmux directory"

    mkdir -p $HOME_TMUX_DIRECTORY
  else
    success-message "tmux directory already exists"
  end
end
