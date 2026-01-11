#!/usr/bin/env fish

function install-fisher
  running-message "install-fisher"

  if type -q fisher
    success-message "fisher already installed"
  else
    information-message "installing fisher"

    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
  end
end
