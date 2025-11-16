#!/usr/bin/env fish

function install-all-ruby-packages
  running-message "install-all-ruby-packages"

  # ruby installed via apt
  install-ruby-full
  install-solargraph
end
