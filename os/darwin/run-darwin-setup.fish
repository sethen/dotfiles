#!/usr/bin/env fish

function run-darwin-setup
  running-message "run-darwin-setup"

  run-common-setup

  copy-fonts
  touch-hushlogin
end
