#!/usr/bin/env fish

function install-rust
  running-message "install-rust"

  if command -s rustc > /dev/null
    success-message "rust already installed"
  else
    asdf plugin add rust https://github.com/asdf-community/asdf-rust.git
    asdf install rust latest
    asdf set rust latest
  end
end
