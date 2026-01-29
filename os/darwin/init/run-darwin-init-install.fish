#!/usr/bin/env fish

function run-darwin-init-install
  running-message "run-darwin-init-install"

  install-cmake
  install-curl
  install-gh
  install-homebrew
end
