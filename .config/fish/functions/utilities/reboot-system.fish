#!/bin/fish

function reboot-computer
    information-message "rebooting in 3 seconds"

    sleep 3
    sudo reboot
end
