#!/usr/bin/env fish

function install-rust
  running-message "install-rust"

  if asdf which rustc >/dev/null 2>/dev/null
    success-message "rust already installed"
  else
    asdf plugin add rust https://github.com/asdf-community/asdf-rust.git
    asdf install rust 1.92.0
    asdf set -u rust 1.92.0
  end
end
