#!/usr/bin/env fish

function add-user-to-docker-group
  running-message "add-user-to-docker-group"

  if not getent group docker > /dev/null
    sudo groupadd docker
  end

  if not id -Gn $USER | grep -qw docker
    information-message "adding $USER to docker group -- you will need to log out and back in for this to take effect"

    sudo usermod -aG docker $USER
  else
    success-message "$USER already added to docker group"
  end
end
