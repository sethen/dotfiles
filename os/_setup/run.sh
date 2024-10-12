#!/bin/zsh

echo ''
header-message 'os setup'
echo ''

if [ $(getent group docker) ]; then
   success-message "docker group exists"
else
   information-message "creating docker group and adding user"

   sudo groupadd docker
   sudo usermod -aG docker $USER
   newgrp docker
fi
