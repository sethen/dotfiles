#!/usr/bin/env fish

function install-ghostty
  running-message "install-ghostty"

  if type -q ghostty
    success-message "ghostty already installed"

    return
  end

  information-message "installing ghostty"

  set url "https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.2.1-0-ppa1/ghostty_1.2.1-0.ppa1_amd64_25.04.deb"
  set filename (basename $url)

  curl -LO $url
  sudo dpkg -i $filename
  sudo apt-get install -f -y
  rm $filename
end
