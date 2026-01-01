#!/usr/bin/env fish

function install-lazydocker
  running-message "install-lazydocker"

  if type -q lazydocker
    success-message "lazydocker is already installed"
  else
    if type -q go
      information-message "installing lazydocker"

      go install github.com/jesseduffield/lazydocker@latest
    else
      error-message "golang not found"
    end
  end
end
