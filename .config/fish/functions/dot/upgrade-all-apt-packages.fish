#!/bin/fish

function upgrade-all-apt-packages
  running-message "upgrade-all-apt-packages"

  sudo apt-get upgrade -y
end
