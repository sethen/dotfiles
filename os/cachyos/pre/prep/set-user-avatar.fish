#!/usr/bin/env fish

function set-user-avatar
    running-message set-user-avatar

    # named by username, so anyone else running this keeps their own avatar
    set -l avatar $DOTFILES_DIRECTORY/avatars/$USER.jpg

    if not test -f $avatar
        information-message "no avatars/$USER.jpg, keeping the current avatar"

        return
    end

    # the greeter's avatar comes from accountsservice, which copies the image
    # into /var/lib/AccountsService/icons where the greeter can read it
    busctl call org.freedesktop.Accounts /org/freedesktop/Accounts/User(id -u) org.freedesktop.Accounts.User SetIconFile s $avatar
end
