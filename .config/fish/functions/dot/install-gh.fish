#!/bin/fish

function install-gh
  running-message "install-gh"

  sudo-apt-install-package gh

  set ID_PUB (ls ~/.ssh/id_*.pub)

  if test -e $ID_PUB
    success-message "public key found"
  else
    information-message "no public key found, logging into github"

    gh auth login
  end
end
