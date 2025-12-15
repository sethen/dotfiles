#!/usr/bin/env fish

function darwin-run-all
  running-message "run-all"

  # init
  darwin-init

  # setup
  darwin-setup

  # packages install via brew
  install-all-brew-packages

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

  confirm-reboot-system
end
