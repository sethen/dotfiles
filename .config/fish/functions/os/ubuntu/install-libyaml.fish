#!/usr/bin/env fish

function install-libyaml
  running-message "install-libyaml"

  sudo-apt-install-package libyaml-dev
end
