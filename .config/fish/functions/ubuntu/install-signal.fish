#!/usr/bin/env fish

function install-signal
  running-message "install-signal"

  if not test -f "$ETC_APT_SOURCES_DIRECTORY/signal-desktop.sources"
    information-message "adding signal repository"

    wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg;
    cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg >/dev/null

    wget -O signal-desktop.sources https://updates.signal.org/static/desktop/apt/signal-desktop.sources;
    cat signal-desktop.sources | sudo tee /etc/apt/sources.list.d/signal-desktop.sources >/dev/null

    rm -rf signal-desktop-keyring.gpg signal-desktop.sources
  else
    success-message "signal repository already added"
  end

  sudo-apt-install-package signal-desktop
end
