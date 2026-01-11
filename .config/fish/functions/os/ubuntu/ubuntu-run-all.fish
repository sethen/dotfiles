#!/usr/bin/env fish

function ubuntu-run-all
  running-message "run-all"

  # setup
  ubuntu-setup

  # packages install via apt
  install-all-apt-packages

  # packages install via brew
  install-all-brew-packages

  # packages install via flatpak
  install-all-flatpak-packages

  # packages installed via snap
  install-all-snap-packages

  # golang
  install-all-golang-packages

  # neovim
  install-neovim

  # node
  install-all-node-packages

  # ruby
  install-all-ruby-packages

  # rust
  install-all-rust-packages

  # clone repos
  clone-all-repos

  # preferences
  set-gnome-preferences

  confirm-reboot-system
end
