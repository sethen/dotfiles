#!/usr/bin/env fish

function set-gtk-cursor-theme
    running-message set-gtk-cursor-theme

    set -l gtk_settings $HOME_CONFIG_DIRECTORY/gtk-3.0/settings.ini

    if not test -f $gtk_settings
        information-message "no $gtk_settings, skipping"

        return
    end

    # chromium-based xwayland apps (spotify, ...) take their cursor from gtk's
    # settings, which cachyos points at bibata instead of hyprland's adwaita
    sed -i 's/^gtk-cursor-theme-name=.*/gtk-cursor-theme-name=Adwaita/' $gtk_settings
end
