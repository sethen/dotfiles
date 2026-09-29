#!/usr/bin/env fish

function add-user-to-vboxusers-group
    running-message add-user-to-vboxusers-group

    # the virtualbox package creates vboxusers. members get USB passthrough to
    # guests; without it the USB device list in a VM is empty.
    if not getent group vboxusers >/dev/null
        error-message "vboxusers group not found, install virtualbox first"

        return 1
    end

    # `id -Gn $USER` looks the user up in /etc/group, which is the right
    # question for "does this need usermod"
    if not id -Gn $USER | grep -qw vboxusers
        information-message "adding $USER to vboxusers group -- you will need to log out and back in for this to take effect"

        sudo usermod -aG vboxusers $USER
    else
        success-message "$USER already added to vboxusers group"
    end
end
