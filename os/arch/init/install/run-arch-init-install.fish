#!/usr/bin/env fish

function run-arch-init-install
  running-message "run-arch-init-install"

  # git
  install-yay

  # pacman
  install-base-devel
  install-base
  install-cmake
  install-efibootmgr
  install-git
  install-linux-firmware
  install-linux
  install-sudo
end
