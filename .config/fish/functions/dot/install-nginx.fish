#!/bin/fish

function install-nginx
  running-message "install-nginx"

  sudo-apt-install-package nginx
end
