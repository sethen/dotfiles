#!/usr/bin/env fish

function install-ruby-full
  running-message "install-ruby-full"

  if type -q ruby
    success-message "ruby-full is already installed"
  else
    sudo-apt-install-package ruby-full
  end
end
