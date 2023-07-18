#!/bin/zsh

if typeset -f gnomeshell-extension-manage > /dev/null; then
    information-message "installing gnomeshell-extension-manage"

    sudo wget -O /usr/local/bin/gnomeshell-extension-manage https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage
    sudo chmod +x /usr/local/bin/gnomeshell-extension-manage

    information-message 'installing dependencies for gnome extensions'

    sudo apt install gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0 -y

    information-message 'installing gnome extensions'

    gnomeshell-extension-manage --install --extension-id 750 --version 3.36 --user &> /dev/null
else
    success-message 'gnomeshell-extension-manage installed'
fi
