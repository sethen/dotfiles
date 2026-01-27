#!/usr/bin/env fish

function install-golang
  running-message "install-golang"

  if type -s go >/dev/null
    success-message "golang already installed"
  else
    asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
    asdf install golang 1.25.5
    asdf set -u golang 1.25.5
  end
end
