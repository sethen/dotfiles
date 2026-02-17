#!/usr/bin/env fish

function make-tmux-directory
    running-message make-tmux-directory

    set -l HOME_TMUX_DIRECTORY $HOME_CONFIG_DIRECTORY/tmux/

    create-directory-if-not-exists $HOME_TMUX_DIRECTORY
end
