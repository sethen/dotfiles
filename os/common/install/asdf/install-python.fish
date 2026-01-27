#!/usr/bin/env fish

function install-python
  running-message "install-python"

  if asdf which python >/dev/null 2>&1
    success-message "python already installed"
  else
    asdf plugin add python https://github.com/asdf-community/asdf-python.git
    asdf install python 3.14.2t
    asdf set -u python 3.14.2t
  end
end
