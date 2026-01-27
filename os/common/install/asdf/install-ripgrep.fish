#!/usr/bin/env fish

function install-ripgrep
  running-message "install-ripgrep"

  if asdf which rg >/dev/null 2>&1
    success-message "ripgrep already installed"
  else
    asdf plugin add ripgrep
    asdf install ripgrep 15.1.0
    asdf set -u ripgrep 15.1.0
  end
end
