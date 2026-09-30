#!/usr/bin/env fish

function symlink-noctalia-config-files
    running-message symlink-noctalia-config-files

    # replaces the config.toml cachyos installs. its stock copy stays in
    # /etc/skel/.config/noctalia/config.toml
    create-directory-if-not-exists $HOME_CONFIG_DIRECTORY/noctalia

    make-symlink $DOTFILES_DIRECTORY/noctalia/config.toml $HOME_CONFIG_DIRECTORY/noctalia/config.toml
end
