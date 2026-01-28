#!/usr/bin/env fish

function run-ubuntu-all
  running-message "run-ubuntu-all"

  # init
  run-common-init

  # setup
  run-common-setup
  run-ubuntu-setup

  # all
  run-common-all
  run-ubuntu-install-apt-packages
  run-ubuntu-install-flatpak-packages
  run-ubuntu-install-git-packages
  run-ubuntu-install-snap-packages

  set-gnome-preferences
  confirm-reboot-system
end
