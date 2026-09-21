#!/usr/bin/env fish

function add-user-to-docker-group
    running-message add-user-to-docker-group

    if test "$SYSTEM_OS" = "darwin"
        success-message "docker Desktop for macOS does not require docker group"
    else
        if not getent group docker >/dev/null
            sudo groupadd docker
        end

        # `id -Gn $USER` looks the user up in /etc/group, which is the right
        # question for "does this need usermod".
        if not id -Gn $USER | grep -qw docker
            information-message "adding $USER to docker group -- you will need to log out and back in for this to take effect"

            sudo usermod -aG docker $USER
        else
            success-message "$USER already added to docker group"
        end

        # `id -Gn` with no user reads this process's own credentials, which are
        # fixed at login and do not change when /etc/group does. While the two
        # disagree, the docker socket (root:docker, 0660) refuses every
        # connection with "permission denied while trying to connect to the
        # docker API", which reads like a docker fault rather than a stale
        # session. Check it on every run: the message above is shown once, on
        # the run that adds the group, and is replaced by "already added"
        # forever after, so it is gone by the time it matters.
        #
        # A new terminal is not enough. The graphical session carries the
        # credentials it was started with and every terminal inherits them;
        # this wants a real logout.
        if not id -Gn | grep -qw docker
            error-message "docker group is missing from this session, log out and back in before using docker"
        end
    end
end
