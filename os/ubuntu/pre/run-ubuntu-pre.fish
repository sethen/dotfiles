#!/usr/bin/env fish

function run-ubuntu-pre
    running-message run-ubuntu-pre

    # update & upgrade
    if test "$RUN_DOTFILES_UPDATE" = true
        sudo apt-get update -y
        # no -y on the upgrade: it can pull in a new kernel, and the run already
        # stops for chsh, sudo and gh auth, so there is nothing unattended to
        # protect. `update` keeps -y, it only refreshes package lists.
        sudo apt-get upgrade
    else
        information-message "run dotfiles update flag not found, skipping update"
    end

    # prep
    copy-fonts

    # install
    #-> apt
    install-bison
    install-build-essential
    install-ca-certificates
    install-curl
    install-git
    install-gnupg
    install-ncurses
end
