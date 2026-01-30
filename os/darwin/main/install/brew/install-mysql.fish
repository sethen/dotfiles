#!/usr/bin/env fish

function install-mysql
  running-message "install-mysql"

  brew-install-package mysql
end
