#!/usr/bin/env fish

function symlink-fish-functions-directory
    running-message symlink-fish-functions-directory

    set -l DOTFILES_FISH_FUNCTIONS_DIRECTORY $DOTFILES_DIRECTORY/fish/functions
    set -l HOME_FISH_FUNCTIONS_DIRECTORY $HOME_FISH_DIRECTORY/functions

    rm -rf $HOME_FISH_FUNCTIONS_DIRECTORY

    if test -d $DOTFILES_FISH_FUNCTIONS_DIRECTORY
        ln -sfv $DOTFILES_FISH_FUNCTIONS_DIRECTORY $HOME_FISH_FUNCTIONS_DIRECTORY
    end
end
