#!/usr/bin/env fish

function install-docker
    running-message install-docker

    # the engine, not the cli. mise supplies docker-cli and docker-compose, but
    # neither ships dockerd, and enable-docker-service in run-common-pre needs
    # docker.service to exist. runs in pre for that reason.
    yay-queue-package docker
    yay-queue-package docker-buildx
end
