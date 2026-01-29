#!/usr/bin/env fish

function run-ubuntu-setup
  running-message "run-ubuntu-setup"

  # install

  ## apt
  install-autoconf
  install-brave-browser
  install-font-manager
  install-fortune-mod
  install-gh
  install-gnome-tweaks
  install-ghostty
  install-gparted
  install-gpick
  install-lsb-release
  install-mdadm
  install-nginx
  install-postgresql
  install-virtualbox
  install-vlc

  ## curl
  install-ghostty

  ## flatpak
  install-flatpak
  install-zen

  ## git
  clone-white-sur-icon-theme-repo

  ## snap
  install-discord
  install-spotify

  set-gnome-preferences
end
