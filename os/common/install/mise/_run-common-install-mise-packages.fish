#!/usr/bin/env fish

function run-common-install-mise-packages
  running-message "run-common-install-mise-packages"

  mise install
  mise env fish | source
end
