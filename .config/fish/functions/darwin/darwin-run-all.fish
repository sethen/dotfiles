#!/usr/bin/env fish

function darwin-run-all
  running-message "run-all"

  # init
  darwin-init

  # setup
  darwin-setup

  # packages install via brew
  install-all-brew-packages

  # node
  install-all-node-packages

  # ruby
  install-all-ruby-packages

  # golang
  install-all-golang-packages

  # clone repos
  clone-all-repos

  confirm-reboot-system
end
