#!/usr/bin/env fish

function install-mise
  running-message "install-mise"

  if type -q mise
    success-message "mise already installed"
  else
    information-message "installing mise"

    curl https://mise.run | sh
  end
end
