#!/usr/bin/env fish

function install-ruby
  running-message "install-ruby"

  if asdf which ruby >/dev/null 2>&1
    success-message "ruby already installed"
  else
    asdf plugin add ruby
    asdf install ruby latest
    asdf set -u ruby latest
  end
end
