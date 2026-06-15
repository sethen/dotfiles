#!/usr/bin/env fish

function symlink-fish-config-file
    running-message symlink-fish-config-file

    make-symlink $DOTFILES_DIRECTORY/config.fish $HOME_FISH_DIRECTORY/config.fish
end
