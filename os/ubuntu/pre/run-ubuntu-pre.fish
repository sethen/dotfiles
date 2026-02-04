#!/usr/bin/env fish

function run-ubuntu-pre
    running-message run-ubuntu-pre

    # update & upgrade
    if test "$RUN_DOTFILES_UPDATE" = true
        sudo apt-get update -y
        sudo apt-get upgrade -y
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
