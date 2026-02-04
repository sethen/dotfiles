#!/usr/bin/env fish

function symlink-git-config-files
    running-message symlink-git-config-files

    ln -sfv $DOTFILES_DIRECTORY/.gitconfig ~/.gitconfig
    ln -sfv $DOTFILES_DIRECTORY/.gitignore_global ~/.gitignore_global
end
