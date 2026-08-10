#!/usr/bin/env fish

function symlink-wezterm-desktop-entry
    running-message symlink-wezterm-desktop-entry

    create-directory-if-not-exists $HOME/.local/share/applications

    # shadows the entry from the wezterm package so xdg-terminal-exec can translate
    # its flags into wezterm's. see the comments in the entry itself
    make-symlink $DOTFILES_DIRECTORY/wezterm/desktop/org.wezfurlong.wezterm.desktop $HOME/.local/share/applications/org.wezfurlong.wezterm.desktop
end
