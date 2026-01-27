#!/usr/bin/env fish

function install-neovim
  running-message "install-neovim"

  if asdf which nvim >/dev/null 2>/dev/null
    success-message "neovim already installed"
  else
    asdf plugin add neovim
    asdf install neovim stable
    asdf set -u neovim stable
  end
end
