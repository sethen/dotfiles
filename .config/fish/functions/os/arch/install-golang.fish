#!/usr/bin/env fish

function install-golang
  running-message "install-golang"

  if type -q go
    success-message "golang already installed"
  else
    asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
    asdf install golang latest
    asdf set golang latest
  end
end
