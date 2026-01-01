#!/usr/bin/env fish

function install-postgresql
  running-message "install-postgresql"

  yay-install-package postgresql
end
