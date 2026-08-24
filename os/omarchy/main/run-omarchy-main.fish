#!/usr/bin/env fish

function run-omarchy-main
    running-message run-omarchy-main

    # install
    #-> pacman
    install-brave
    install-ca-certificates
    install-curl
    install-ffmpeg
    install-font-manager
    install-fortune-mod
    install-gparted
    install-gpick
    install-grub
    install-mariadb-clients
    install-mdadm
    install-nginx
    install-openssh
    install-postgresql
    install-spotify
    install-ttf-jetbrains-mono
    install-virtualbox
    install-vlc
    install-wezterm

    # defined in pre/prep with the other symlink steps, but it has to run here:
    # clone-wallpapers-repo does not fetch the repo until run-common-main
    symlink-wallpapers
end
