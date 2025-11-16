#!/usr/bin/env fish

function install-starship
  running-message "install-starship"

  if type -q starship
    success-message "starship already installed"

    return
  end

  information-message "installing starship"

  curl -sS https://starship.rs/install.sh | sh
end
