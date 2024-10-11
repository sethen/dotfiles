#!/bin/zsh

apt-get-install-if-package-not-exists docker-ce
apt-get-install-if-package-not-exists docker-ce-cli
apt-get-install-if-package-not-exists containerd.io
apt-get-install-if-package-not-exists docker-buildx-plugin
apt-get-install-if-package-not-exists docker-compose-plugin
