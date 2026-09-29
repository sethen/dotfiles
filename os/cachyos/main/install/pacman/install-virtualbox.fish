#!/usr/bin/env fish

function install-virtualbox
    running-message install-virtualbox

    # virtualbox needs a host-modules provider, and the prebuilt one only
    # matches the stock arch kernel. linux-cachyos needs the dkms build, which
    # compiles against the installed linux-cachyos-headers. name it first so
    # --noconfirm cannot pick a provider on its own.
    yay-install-package virtualbox-host-dkms
    yay-install-package virtualbox
end
