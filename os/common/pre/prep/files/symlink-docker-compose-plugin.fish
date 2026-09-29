#!/usr/bin/env fish

function symlink-docker-compose-plugin
    running-message symlink-docker-compose-plugin

    # macOS gets compose from Docker Desktop, which links its own plugins into
    # ~/.docker/cli-plugins
    if test "$SYSTEM_OS" = "darwin"
        success-message "docker Desktop for macOS manages its own compose plugin"

        return
    end

    # `docker compose` is a cli plugin, and the docker cli only looks for plugins
    # in ~/.docker/cli-plugins and the system plugin directories, never on PATH.
    # mise's docker-compose is on PATH as `docker-compose`, so without this link
    # `docker compose` fails with "unknown command". mise keeps `latest` pointed
    # at the current install, so the link survives a mise upgrade.
    set -l MISE_DATA (set -q MISE_DATA_DIR; and echo $MISE_DATA_DIR; or echo $HOME/.local/share/mise)
    set -l COMPOSE_BINARY $MISE_DATA/installs/docker-compose/latest/docker-compose
    set -l PLUGINS_DIRECTORY $HOME/.docker/cli-plugins

    create-directory-if-not-exists $PLUGINS_DIRECTORY

    make-symlink $COMPOSE_BINARY $PLUGINS_DIRECTORY/docker-compose
end
