#!/usr/bin/env fish

function install-fd
  running-message "install-fd"

  sudo-apt-install-package fd
end
