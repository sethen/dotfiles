#!/usr/bin/env fish

function run-darwin-install-init-brew-packages
  running-message "run-darwin-install-init-brew-packages"

  install-homebrew
  install-cmake
end
