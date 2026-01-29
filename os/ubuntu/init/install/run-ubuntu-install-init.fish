#!/usr/bin/env fish

function run-ubuntu-install-init
  running-message "run-ubuntu-install-init"

  # apt
  install-bison
  install-build-essential
  install-ca-certificates
  install-cmake
  install-curl
  install-git
  install-gnupg
  install-ncurses
end
