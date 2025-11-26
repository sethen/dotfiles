#!/usr/bin/env fish

function install-neovim
  running-message "install-neovim"

  if string match -q '*' (asdf list neovim)
    success-message "neovim already installed"
  else
    asdf plugin add neovim
    asdf install neovim stable
    asdf set neovim stable
  end
end

