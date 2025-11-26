#!/usr/bin/env fish

function install-all-ruby-packages
  running-message "install-all-ruby-packages"

  # dependencies
  install-libyaml

  # ruby
  install-ruby
end
