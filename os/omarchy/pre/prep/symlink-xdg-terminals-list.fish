#!/usr/bin/env fish

function symlink-xdg-terminals-list
    running-message symlink-xdg-terminals-list

    # without this file xdg-terminal-exec picks whichever TerminalEmulator entry it
    # finds first, which is how SUPER+RETURN and the omarchy launcher end up on
    # something other than wezterm. see the comments in the list itself.
    make-symlink $DOTFILES_DIRECTORY/wezterm/desktop/xdg-terminals.list $HOME_CONFIG_DIRECTORY/xdg-terminals.list
end
