#!/usr/bin/env fish

function run-omarchy-pre
    running-message run-omarchy-pre

    # update & upgrade
    if test "$RUN_DOTFILES_UPDATE" = true
        # `omarchy update`, not `yay`. omarchy 4 ships a pacman PreTransaction
        # hook (omarchy-update-pacman-guard) that aborts any transaction
        # carrying both -S and -u, so a bare `yay` now dies with "failed to run
        # transaction hooks" and upgrades nothing at all. the guard ignores
        # single-package installs, which is why yay-install-package still works.
        #
        # it is also a superset of what yay was doing: prune the cache, take a
        # snapshot, refresh keyrings, upgrade repo packages, run migrations,
        # then omarchy-update-aur-pkgs. no -y, so the transaction is still shown
        # before it commits, and pacman can still replace a kernel in it.
        # a non-zero exit here does not mean the upgrade did not happen. the last
        # step, omarchy-update-mise, runs `MISE_MINIMUM_RELEASE_AGE=0 mise up`,
        # deliberately bypassing mise's release cooldown, so a publisher that
        # tags a version before uploading its binaries fails the whole command
        # long after the packages, snapshot and migrations have all succeeded.
        # say what happened and point at the transcript rather than guess.
        if not omarchy update
            error-message "omarchy update reported a failure, see /tmp/omarchy-update.log"
        end
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
