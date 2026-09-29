#!/usr/bin/env fish

function install-virtualbox
    running-message install-virtualbox

    # virtualbox needs a host-modules provider, and the prebuilt one only
    # matches the stock arch kernel. linux-cachyos needs the dkms build, which
    # compiles against the installed linux-cachyos-headers. queue it alongside
    # virtualbox so the dependency is satisfied by a named target and
    # --noconfirm cannot pick a provider on its own.
    yay-queue-package virtualbox-host-dkms
    yay-queue-package virtualbox
end
