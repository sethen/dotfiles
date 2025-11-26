#!/usr/bin/env fish

function install-go
  running-message "install-go"

  if command -s go > /dev/null
    success-message "go already installed"
  else
    asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
    asdf install golang latest
    asdf set golang latest
  end
end
