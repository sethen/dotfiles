#!/usr/bin/env fish

function symlink-mise-config-files
    running-message symlink-mise-config-files

    make-symlink $DOTFILES_DIRECTORY/mise/.default-gems $HOME/.default-gems
    make-symlink $DOTFILES_DIRECTORY/mise/mise.toml $HOME_CONFIG_DIRECTORY/mise/mise.toml
end
