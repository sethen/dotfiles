#!/bin/fish

function install-docker
  running-message "install-docker"

  if not test -e "$ETC_APT_SOURCES_DIRECTORY/docker.list"
    information-message "adding docker repository"

    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo "deb [arch=(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/ubuntu \
    (lsb_release -cs) stable" | \

    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  else
    success-message "docker repository already added"
  end

  sudo-apt-install-package docker-ce
  sudo-apt-install-package docker-ce-cli
  sudo-apt-install-package containerd.io
  sudo-apt-install-package docker-buildx-plugin
  sudo-apt-install-package docker-compose-plugin
end
