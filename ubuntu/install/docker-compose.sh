#!/bin/zsh

if [[ ! -a $DOCKER_CLI_PLUGINS_DIRECTORY/docker-compose ]]; then
	information_message "installing docker-compose"

	mkdir -p $DOCKER_CLI_PLUGINS_DIRECTORY
	curl -SL https://github.com/docker/compose/releases/download/v$DOCKER_COMPOSE_VERSION/docker-compose-linux-x86_64 -o $DOCKER_CLI_PLUGINS_DIRECTORY/docker-compose
else
	success_message "docker-compose already installed"
fi
