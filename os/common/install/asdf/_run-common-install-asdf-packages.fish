#!/usr/bin/env fish

function run-common-install-asdf-packages
  running-message "run-common-install-asdf-packages"

  install-golang
  install-neovim
  install-node
  install-python
  install-ruby
  install-rust
end
