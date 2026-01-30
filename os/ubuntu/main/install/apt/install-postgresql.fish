#!/usr/bin/env fish

function install-postgresql
  running-message "install-postgresql"

  sudo-apt-install-package postgresql
end
