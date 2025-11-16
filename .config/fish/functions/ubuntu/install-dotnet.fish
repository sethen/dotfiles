#!/usr/bin/env fish

function install-dotnet
  running-message "install-dotnet"

  if test -e $ETC_APT_SOURCES_DIRECTORY/dotnet-ubuntu-*.sources
    success-message "dotnet repository already added"
  else
    information-message "adding dotnet repository"

    sudo add-apt-repository ppa:dotnet/backports
    sudo apt-get update
  end

  sudo-apt-install-package dotnet-sdk-9.0
end
