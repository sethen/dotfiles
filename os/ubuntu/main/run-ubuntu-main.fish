#!/usr/bin/env fish

function run-ubuntu-main
    running-message run-ubuntu-main

    # install
    #-> apt
    install-autoconf
    install-brave-browser
    install-font-manager
    install-fonts-jetbrains-mono
    install-fortune-mod
    install-gnome-tweaks
    install-gparted
    install-gpick
    install-lsb-release
    install-mariadb-client
    install-mdadm
    install-nginx
    install-postgresql
    install-virtualbox
    install-vlc
    #-> curl
    install-wezterm
    #-> flatpak
    install-flatpak
    install-zen
    #-> git
    clone-white-sur-icon-theme-repo
    #-> snap
    install-discord
    install-spotify

    set-gnome-preferences
end
