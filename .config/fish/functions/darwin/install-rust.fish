#!/usr/bin/env fish

function install-rust
  running-message "install-rust"

  if string length (asdf list rust) > 0
    success-message "rust already installed"
  else
    asdf plugin add rust https://github.com/asdf-community/asdf-rust.git
    asdf install rust latest
    asdf set rust latest
  end
end
