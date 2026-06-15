#!/usr/bin/env fish

function symlink-git-config-files
    running-message symlink-git-config-files

    make-symlink $DOTFILES_DIRECTORY/.gitconfig $HOME/.gitconfig
    make-symlink $DOTFILES_DIRECTORY/.gitignore_global $HOME/.gitignore_global
end
