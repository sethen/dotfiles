#!/usr/bin/env fish

function run-arch-setup
  running-message "run-arch-setup"

  copy-fonts
  run-arch-setup-install
end
