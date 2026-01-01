#!/usr/bin/env fish

function install-mdadm
  running-message "install-mdadm"

  yay-install-package mdadm
end
