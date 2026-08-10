#!/usr/bin/env fish

function symlink-wezterm-open
    running-message symlink-wezterm-open

    create-directory-if-not-exists $HOME/.local/bin

    # the desktop entry runs `wezterm-open` by name, so it has to resolve on the
    # session PATH rather than only in an interactive shell. ~/.local/bin is where
    # uwsm picks up user binaries.
    make-symlink $DOTFILES_DIRECTORY/wezterm/desktop/wezterm-open $HOME/.local/bin/wezterm-open
end
