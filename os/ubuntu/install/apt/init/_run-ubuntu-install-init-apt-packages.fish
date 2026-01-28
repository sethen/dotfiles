#!/usr/bin/env fish

function run-ubuntu-install-init-apt-packages
  running-message "run-ubuntu-install-init-apt-packages"

  install-bison
  install-build-essential
  install-ca-certificates
  install-cmake
  install-curl
  install-git
  install-gnupg
  install-ncurses
end
