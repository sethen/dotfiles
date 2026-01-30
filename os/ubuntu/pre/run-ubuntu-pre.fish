#!/usr/bin/env fish

function run-ubuntu-pre
  running-message "run-ubuntu-pre"

  # update & upgrade
  sudo apt-get update -y
  sudo apt-get upgrade -y

  # prep
  copy-fonts

  # install
  #-> apt
  install-bison
  install-build-essential
  install-ca-certificates
  install-cmake
  install-curl
  install-git
  install-gnupg
  install-ncurses
end
