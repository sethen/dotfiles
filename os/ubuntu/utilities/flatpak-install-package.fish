#!/usr/bin/env fish

function flatpak-install-package
    running-message flatpak-install-package

    set -l PACKAGE $argv[1]

    if not flatpak list --columns=application | string match -q $PACKAGE
        information-message "installing $PACKAGE"

        flatpak install flathub $PACKAGE -y
    else
        success-message "$PACKAGE already installed"
    end
end
