#!/usr/bin/env fish

function install-all-ruby-packages
  running-message "install-all-ruby-packages"

  # dependencies
  install-libssl
  install-libyaml
  install-zlib1g
  install-libffi
  install-libgmp

  install-ruby
end
