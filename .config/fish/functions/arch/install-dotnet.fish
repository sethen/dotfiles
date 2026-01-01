#!/usr/bin/env fish

function install-dotnet-sdk
  running-message "install-dotnet-sdk"

  yay-install-package dotnet-sdk
end
