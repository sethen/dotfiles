#!/bin/fish

function install-lazygit
  running-message "install-lazygit"

  if type -q lazygit
    success-message "lazygit is already installed"
  else
    if type -q go
      information-message "installing lazygit"

      go install github.com/jesseduffield/lazygit@latest
    else
      error-message "golang not found"
    end
  end
end
