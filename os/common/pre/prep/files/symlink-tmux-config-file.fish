#!/usr/bin/env fish

function symlink-tmux-config-file
    running-message symlink-tmux-config-file

    set -l HOME_TMUX_DIRECTORY $HOME_CONFIG_DIRECTORY/tmux

    ln -sfv $DOTFILES_DIRECTORY/tmux/tmux.conf $HOME_CONFIG_DIRECTORY/tmux
end
