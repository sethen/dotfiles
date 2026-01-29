#!/usr/bin/env fish

function run-ubuntu-init
  running-message "run-ubuntu-init"

  sudo apt-get update -y
  sudo apt-get upgrade -y

  # prep
  copy-fonts

  # install

  ## apt
  install-bison
  install-build-essential
  install-ca-certificates
  install-cmake
  install-curl
  install-git
  install-gnupg
  install-ncurses
end
