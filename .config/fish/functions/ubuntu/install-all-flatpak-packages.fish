#!/usr/bin/env fish

function install-all-flatpak-packages
  running-message "install-all-flatpak-packages"

  install-flatpak
  install-gnome-software-plugin-flatpak

  # packages
  install-zen
end
