#!/usr/bin/env fish

function install-neovim
  running-message "install-neovim"

  if string length (asdf list neovim) > 0
    success-message "neovim already installed"
  else
    asdf plugin add neovim
    asdf install neovim stable
    asdf set neovim stable
  end
end

