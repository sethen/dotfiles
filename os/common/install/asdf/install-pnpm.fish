#!/usr/bin/env fish

function install-pnpm
  running-message "install-pnpm"

  if asdf which pnpm >/dev/null 2>&1
    success-message "pnpm already installed"
  else
    asdf plugin add pnpm
    asdf install pnpm latest
    asdf set -u pnpm latest
  end
end
