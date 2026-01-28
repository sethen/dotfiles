#!/usr/bin/env fish

function install-starship
  running-message "install-starship"

  if asdf which starship >/dev/null 2>/dev/null
    success-message "starship already installed"
  else
    asdf plugin add starship
    asdf install starship latest
    asdf set -u starship latest
  end
end
