#!/usr/bin/env fish

function arch-run-all
  running-message "run-all"

  # update and upgrade
  update-and-upgrade-all-yay-packages

  # init
  arch-init

  # setup
  arch-setup

  # packages install via yay
  install-all-yay-packages

  # asdf
  install-asdf

  # golang
  install-all-golang-packages

  # neovim
  # install-neovim

  # node
  install-all-node-packages

  # ruby
  install-all-ruby-packages

  # rust
  install-all-rust-packages

  # clone repos
  clone-all-repos

  confirm-reboot-system
end
