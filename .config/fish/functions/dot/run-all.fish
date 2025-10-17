#!/bin/fish

function run-all
  running-message "run-all"

  # init
  dot-init

  # setup
  dot-setup

  # packages install via apt
  install-all-apt-packages

  # packages installed via snap
  install-all-snap-packages

  # node
  install-all-node-packages

  # ruby
  install-all-ruby-packages

  # rust
  install-all-rust-packages

  # golang
  install-all-golang-packages

  # update and upgrade
  update-and-upgrade-all-apt-packages

  # clone repos
  clone-all-repos

  # preferences
  set-gnome-preferences

  confirm-reboot-system
end
