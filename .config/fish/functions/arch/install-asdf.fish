#!/usr/bin/env fish

function install-asdf
  running-message "install-asdf"

  if type -q asdf
    success-message "asdf already installed"
  else
    information-message "installing asdf"

    git clone https://aur.archlinux.org/asdf-vm.git
    cd asdf-vm
    makepkg -si
    cd ..
    rm -rf asdf-vm
  end
end
