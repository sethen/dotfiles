#!/usr/bin/env fish

function symlink-fish-functions-directory
    running-message symlink-fish-functions-directory

    make-symlink $DOTFILES_DIRECTORY/fish/functions $HOME_FISH_DIRECTORY/functions
end
