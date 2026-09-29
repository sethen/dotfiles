#!/usr/bin/env fish

function run-cachyos-main
    running-message run-cachyos-main

    # install
    #-> pacman
    install-brave
    install-ca-certificates
    install-curl
    install-discord
    install-ffmpeg
    install-font-manager
    install-fortune-mod
    install-gparted
    install-gpick
    install-mariadb-clients
    install-mdadm
    install-nginx
    install-openssh
    install-postgresql
    install-spotify
    install-ttf-jetbrains-mono
    install-virtualbox
    install-vlc
    install-kitty
end
