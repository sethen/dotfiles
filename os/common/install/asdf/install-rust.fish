#!/usr/bin/env fish

function install-rust
  running-message "install-rust"

  if asdf which rustc >/dev/null 2>&1
    success-message "rust already installed"
  else
    asdf plugin add rust
    asdf install rust latest
    asdf set -u rust latest
  end
end
