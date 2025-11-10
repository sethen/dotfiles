#!/usr/bin/env fish

function switch-shell-to-fish
  running-message "switch-shell-to-fish"

  if test "$SHELL" != "/opt/homebrew/bin/fish"
    information-message "switching shell to fish, you may need to re-login"

    echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
    chsh -s /opt/homebrew/bin/fish
  else
    success-message "shell is already fish"
  end
end
