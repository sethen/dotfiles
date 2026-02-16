#!/usr/bin/env fish

function install-yay
    if command -q yay
        success-message "yay is already installed"
    else
        information-message "installing yay"

        set -l build_dir (mktemp -d)

        git clone https://aur.archlinux.org/yay.git $build_dir
        cd $build_dir

        makepkg -si --noconfirm

        cd -
        rm -rf $build_dir
    end
end
