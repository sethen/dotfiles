#!/bin/zsh

echo ''
header-message 'os setup'

if ! getent group docker > /dev/null; then
  sudo groupadd docker
fi

if ! id -nG "$USER" | grep -qw docker; then
  information-message "adding $USER to docker group -- you will need to log out and back in for this to take effect"

  sudo usermod -aG docker "$USER"
else
  success-message "$USER already added to docker group"
fi
