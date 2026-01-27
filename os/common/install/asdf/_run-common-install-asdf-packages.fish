#!/usr/bin/env fish

function run-common-install-asdf-packages
  running-message "run-common-install-asdf-packages"

  install-fd
  install-golang
  install-neovim
  install-node
  install-pnpm
  install-python
  install-ripgrep
  install-ruby
  install-rust
  install-starship
  install-tmux
end
