#!/usr/bin/env fish

function install-ruby
  running-message "install-ruby"

  if asdf which ruby >/dev/null 2>/dev/null
    success-message "ruby already installed"
  else
    asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
    asdf install ruby latest
    asdf set ruby latest
  end
end
