#!/usr/bin/fish

function run-ubuntu-all
  running-message "run-ubuntu-all"

  # common
  run-common-all

  # ubuntu
  run-ubuntu-init
  run-ubuntu-setup

  set-gnome-preferences
  confirm-reboot-system
end
