#!/usr/bin/env fish

function enable-docker-service
    running-message enable-docker-service

    # macOS runs the engine inside Docker Desktop, so there is no system unit
    if test "$SYSTEM_OS" = "darwin"
        success-message "docker Desktop for macOS manages its own engine"

        return
    end

    # the daemon is a separate package from the cli. mise supplies docker-cli and
    # docker-compose, neither of which includes dockerd, so on a machine where
    # the engine was never installed there is no unit to enable and `docker
    # compose` fails to connect no matter what the group says.
    if not systemctl list-unit-files docker.service >/dev/null 2>&1
        error-message "no docker.service found; install the engine (omarchy: yay -S docker docker-buildx)"

        return 1
    end

    # enable and start are separate states: a machine can have one without the
    # other, and both matter. --now covers the start half of enable.
    if test (systemctl is-enabled docker 2>/dev/null) != enabled
        information-message "enabling docker service"

        sudo systemctl enable --now docker
    else if test (systemctl is-active docker 2>/dev/null) != active
        information-message "starting docker service"

        sudo systemctl start docker
    else
        success-message "docker service already enabled and running"
    end
end
