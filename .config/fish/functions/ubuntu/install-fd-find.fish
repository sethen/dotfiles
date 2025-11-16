#!/usr/bin/env fish

function install-fd-find
  running-message "install-fd-find"

  sudo-apt-install-package fd-find
end
