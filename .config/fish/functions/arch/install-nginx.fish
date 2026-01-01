#!/usr/bin/env fish

function install-nginx
  running-message "install-nginx"

  yay-install-package nginx
end
