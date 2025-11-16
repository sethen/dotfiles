#!/usr/bin/env fish

function install-bob
  running-message "install-bob"

  if type -q bob
    success-message "bob already installed"
  else if type -q cargo
    information-message "installing bob"

    cargo install --git https://github.com/MordechaiHadad/bob --locked
  else
    error-message "cargo not found"
  end
end
