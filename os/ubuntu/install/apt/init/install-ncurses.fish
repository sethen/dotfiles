#!/usr/bin/env fish

function install-ncurses
  running-message "install-ncurses"

  sudo-apt-install-package ncurses-dev
end
