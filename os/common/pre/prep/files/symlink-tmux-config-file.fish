#!/usr/bin/env fish

function symlink-tmux-config-file
    running-message symlink-tmux-config-file

    make-symlink $DOTFILES_DIRECTORY/tmux/tmux.conf $HOME_CONFIG_DIRECTORY/tmux/tmux.conf
end
