#!/usr/bin/env fish

function run-ubuntu-setup
  running-message "run-ubuntu-setup"

  copy-fonts
  run-ubuntu-install-setup
  set-gnome-preferences
end
