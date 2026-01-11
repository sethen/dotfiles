#!/usr/bin/env fish

function install-nginx
  running-message "install-nginx"

  brew-install-package nginx
end
