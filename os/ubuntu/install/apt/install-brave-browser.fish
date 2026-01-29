#!/usr/bin/env fish

function install-brave-browser
  running-message "install-brave-browser"

  if not test -f "/etc/apt/sources.list.d/brave-browser-release.sources"
    information-message "adding brave-browser repository"

    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources
  else
    success-message "brave-browser repository already added"
  end

  sudo-apt-install-package brave-browser
end
