#!/usr/bin/env fish

function install-rust
  running-message "install-rust"

  if type -q rustup
    success-message "rust already installed"
  else
    information-message "installing rust"

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  end
end
