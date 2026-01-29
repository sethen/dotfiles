#!/usr/bin/env fish

function run-darwin-setup
  running-message "run-darwin-setup"

  copy-fonts
  touch-hushlogin

  run-common-setup-install
end
