#!/usr/bin/env fish

function run-ubuntu-all
  running-message "run-ubuntu-all"

  # setup
  run-ubuntu-setup
  run-common-setup

  # all
  run-ubuntu-install-apt-packages
  run-ubuntu-install-brew-packages
  run-ubuntu-install-curl-packages
  run-ubuntu-install-flatpak-packages
  run-ubuntu-install-git-packages
  run-ubuntu-install-snap-packages
  run-common-all

  set-gnome-preferences
  confirm-reboot-system
end
