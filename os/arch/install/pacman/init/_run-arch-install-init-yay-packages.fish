#!/usr/bin/env fish

function run-arch-install-init-pacman-packages
  running-message "run-arch-install-init-pacman-packages"

  install-base-devel
  install-base
  install-cmake
  install-efibootmgr
  install-git
  install-linux-firmware
  install-linux
  install-sudo
end
