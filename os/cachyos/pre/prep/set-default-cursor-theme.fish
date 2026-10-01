#!/usr/bin/env fish

function set-default-cursor-theme
    running-message set-default-cursor-theme

    # xwayland apps draw their own cursor instead of getting hyprland's adwaita
    # (decorations.lua), falling back to the "default" theme, which cachyos
    # points at bibata
    create-directory-if-not-exists $HOME/.icons/default

    printf '[Icon Theme]\nName=Default\nComment=Default Cursor Theme\nInherits=Adwaita\n' >$HOME/.icons/default/index.theme
end
