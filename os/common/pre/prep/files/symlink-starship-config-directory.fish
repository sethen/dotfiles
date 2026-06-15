#!/usr/bin/env fish

function symlink-starship-config-directory
    running-message symlink-starship-config-directory

    make-symlink $DOTFILES_DIRECTORY/starship/starship.toml $HOME_CONFIG_DIRECTORY/starship.toml
end
