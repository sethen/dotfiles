#!/usr/bin/env fish

function run-darwin-init
  running-message "run-darwin-init"

  # prep
  copy-fonts
  touch-hushlogin

  # install
  install-homebrew
  install-gh
end
