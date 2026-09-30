#!/usr/bin/env fish

function install-nautilus
    running-message install-nautilus

    # nautilus is gtk4, so it picks up noctalia's gtk-4.0 theme where dolphin
    # (qt, fusion style) does not. gvfs backs its trash, drive mounting and
    # network locations; without it those are missing
    yay-queue-package nautilus
    yay-queue-package gvfs

    # cachyos ships dolphin as the handler for folders, so "open folder" from
    # other apps launches it unless this is overridden. xdg-mime only writes
    # mimeapps.list, so it is safe to run before the queue is installed
    set -l DESKTOP_FILE org.gnome.Nautilus.desktop

    if test (xdg-mime query default inode/directory) = $DESKTOP_FILE
        success-message "nautilus already the default file manager"
    else
        information-message "setting nautilus as the default file manager"

        xdg-mime default $DESKTOP_FILE inode/directory
    end
end
