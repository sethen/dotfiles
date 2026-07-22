#!/usr/bin/env fish

function confirm-reboot-system
    if prompt-confirm "do you want to reboot the system?"
        reboot-system
    end
end
