#!/usr/bin/env fish

function run-cachyos-pre
    running-message run-cachyos-pre

    # install
    #-> pacman
    install-yay

    # update & upgrade
    if test "$RUN_DOTFILES_UPDATE" = true
        # --update is the go-ahead, so nothing here should stop to ask. --noconfirm
        # takes pacman's default answer at every prompt (a conflict still aborts
        # rather than removing a package), and --sudoloop keeps sudo alive so a
        # long AUR build does not stall on a password prompt halfway through
        if not yay -Syu --noconfirm --sudoloop
            error-message "yay -Syu reported a failure"
        end
    else
        information-message "run dotfiles update flag not found, skipping update"
    end

    #-> yay
    install-docker
    yay-install-queued-packages

    # prep
    copy-fonts
    symlink-hyprland-config-files
    symlink-noctalia-config-files
end
