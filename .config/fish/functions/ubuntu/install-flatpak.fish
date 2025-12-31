#!/usr/bin/env fish

function install-flatpak
  running-message "install-flatpak"

  sudo-apt-install-package flatpak
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
end
