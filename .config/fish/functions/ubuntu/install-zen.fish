#!/usr/bin/env fish

function install-zen
  running-message "install-zen"

  flatpak-install-package app.zen_browser.zen
end
