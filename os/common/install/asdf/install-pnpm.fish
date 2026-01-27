asdf plugin add pnpm

#!/usr/bin/env fish

function install-pnpm
  running-message "install-pnpm"

  if asdf which pnpm >/dev/null 2>/dev/null
    success-message "pnpm already installed"
  else
    asdf plugin add pnpm
    asdf install pnpm 10.28.2
    asdf set -u pnpm 10.28.2
  end
end
