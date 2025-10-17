#!/bin/fish

function update-and-upgrade-all-apt-packages
  running-message "update-and-upgrade-all-apt-packages"

  update-all-apt-packages
  upgrade-all-apt-packages
end
