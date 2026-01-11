#!/usr/bin/env fish

function install-zlib1g
  running-message "install-zlib1g"

  sudo-apt-install-package zlib1g-dev
end
