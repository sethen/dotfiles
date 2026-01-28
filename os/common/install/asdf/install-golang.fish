#!/usr/bin/env fish

function install-golang
  running-message "install-golang"

  if asdf which golang >/dev/null 2>/dev/null
    success-message "golang already installed"
  else
    asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
    asdf install golang latest
    asdf set -u golang latest
  end
end
