#!/bin/zsh

function install-dotnet
  running-message "install-dotnet"

  if not test -f "$ETC_APT_SOURCES_DIRECTORY/dotnet-ubuntu-backports-plucky.sources"
    information-message "adding dotnet repository"

    sudo add-apt-repository ppa:dotnet/backports
    sudo apt-get update
  else
    success-message "dotnet repository already added"
  end

  sudo-apt-install-package dotnet-sdk-9.0
end
