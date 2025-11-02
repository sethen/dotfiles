#!/bin/fish

function install-gnome-tweaks
  running-message "install-gnome-tweaks"

  sudo-apt-install-package gnome-tweaks
end
