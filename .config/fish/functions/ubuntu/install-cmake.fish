#!/usr/bin/env fish

function install-cmake
  running-message "install-cmake"

  sudo-apt-install-package cmake
end
