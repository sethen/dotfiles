#!/usr/bin/env fish

function install-python
  running-message "install-python"

  if asdf which python >/dev/null 2>&1
    success-message "python already installed"
  else
    asdf plugin add python
    asdf install python latest
    asdf set -u python latest
  end
end
