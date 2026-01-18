#!/usr/bin/env fish

function reboot-system
  information-message "rebooting in 3 seconds"

  sleep 3
  sudo reboot
end
