#!/usr/bin/env fish

function install-golang
  running-message "install-golang"

  if asdf which go >/dev/null 2>&1
    success-message "golang already installed"
  else
    asdf plugin add golang
    asdf install golang latest
    asdf set -u golang latest
  end
end
