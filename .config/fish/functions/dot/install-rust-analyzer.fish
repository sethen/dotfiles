#!/bin/fish

function install-rust-analyzer
  running-message "install-rust-analzyer"

  if type -q rust-analyzer
    success-message 'rust-analyzer already installed'
  else
    information-message 'installing rust-analyzer'

    rustup component add rust-analyzer
  end
end
