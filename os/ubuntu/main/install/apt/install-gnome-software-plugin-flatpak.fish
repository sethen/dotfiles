#!/usr/bin/env fish

function install-gnome-software-plugin-flatpak
    running-message install-gnome-software-plugin-flatpak

    sudo-apt-install-package gnome-software-plugin-flatpak
end
