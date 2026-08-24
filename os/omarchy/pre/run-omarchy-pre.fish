#!/usr/bin/env fish

function run-omarchy-pre
    running-message run-omarchy-pre

    # update & upgrade
    if test "$RUN_DOTFILES_UPDATE" = true
        # no --noconfirm: this is a full system upgrade, and pacman will happily
        # replace a kernel or a bootloader in it. the run already prompts for
        # chsh, sudo and gh auth, so there is nothing unattended to protect.
        # the per-package --noconfirm in yay-install-package stays: those are
        # idempotent single-package installs
        yay
    else
        information-message "run dotfiles update flag not found, skipping update"
    end

    # prep
    copy-fonts
    symlink-hyprland-config-files
    symlink-launch-screensaver
    symlink-quickshell-config-files
    symlink-wezterm-open
    symlink-wezterm-desktop-entry
    symlink-xdg-terminals-list
end
