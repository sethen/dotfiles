#!/usr/bin/env fish

function run-common-install-golang-packages
  running-message "run-common-install-golang-packages"

  install-lazydocker
  install-lazygit
end
