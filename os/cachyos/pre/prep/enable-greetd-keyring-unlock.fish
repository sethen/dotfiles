#!/usr/bin/env fish

function enable-greetd-keyring-unlock
    running-message enable-greetd-keyring-unlock

    set -l pam_file /etc/pam.d/greetd

    if not test -f $pam_file
        information-message "no $pam_file, skipping keyring unlock"

        return
    end

    if grep -q pam_gnome_keyring.so $pam_file
        information-message "$pam_file already unlocks gnome-keyring"

        return
    end

    # greetd's pam file does not hand the login password to gnome-keyring, so
    # the keyring asks for it again on every login. optional keeps a missing
    # module from blocking login, and the lines go after system-local-login so
    # the password has been checked before the keyring sees it
    sudo sed -i \
        -e '/^auth.*system-local-login/a auth       optional     pam_gnome_keyring.so' \
        -e '/^session.*system-local-login/a session    optional     pam_gnome_keyring.so auto_start' \
        $pam_file
end
