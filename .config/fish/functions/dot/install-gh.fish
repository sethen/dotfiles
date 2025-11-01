#!/bin/fish

function install-gh
  running-message "install-gh"

  sudo-apt-install-package gh

  if test -e $HOME/.ssh/id_*.pub
    success-message "public key found"
  else
    information-message "no public key found, logging into github"

    gh auth login
  end
end
