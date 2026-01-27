#!/usr/bin/env fish

function install-ncurses
  running-message "installing ncurses"

  if not pkg-config --exists ncursesw
    information-message "installing ncurses"

    sudo apt-get install -y libncursesw5-dev
  else
    success-message "ncurses already installed"
  end
end
