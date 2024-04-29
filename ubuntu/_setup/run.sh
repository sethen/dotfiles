#!/bin/zsh

echo ''
header-message 'ubuntu setup'
echo ''

information-message 'adding keys'

check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/keys/github-cli.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/keys/google-chrome.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/keys/visual-studio-code.sh

echo ''
information-message 'updating packages'

sudo apt update -y

echo ''
information-message 'removing packages'

sudo apt autoremove -y

echo ''
information-message 'installing packages'

# login to github first
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/github-cli.sh

# _setup/packages other packages
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/discord.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/gnome-shell-extension-manager.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/google-chrome.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/gparted.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/gpick.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/kazam.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/kitty.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/mdadm.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/nginx.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/ripgrep.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/spotify.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/virtualbox.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/visual-studio-code.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/vlc.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/zoom.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/zsh-autosuggestions.sh

# nvm, node & node modules
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/node.sh

# golang & gopls
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/go.sh

# chruby, ruby-install, ruby & solargraph gem
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/ruby.sh

# rust & rust-analyzer
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/rust.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/bob.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/neovim.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/packages/xsel.sh

echo ''
read 'UPGRADE?would you like to upgrade your existing packages? [Yy/Nn] '
echo ''

if [[ $UPGRADE =~ '[Yy]' ]]; then
    success-message 'upgrading apt packages'

    sudo apt upgrade -y
    sudo apt autoremove -y
fi

information-message 'cloning repositories'

check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/repositories/colloid-icon-theme.sh

echo ''
information-message 'enabling gnome extensions'

dconf write /org/gnome/shell/enabled-extensions "['openweather-extension@jenslody.de', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'workspace-indicator@gnome-shell-extensions.gcampax.github.com', 'ubuntu-dock@ubuntu.com', 'tiling-assistant@ubuntu.com', 'openweather-extension@penguin-teal.github.io']"


information-message 'applying gnome extension tweaks'
echo ''

check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/extensions/dash-to-dock.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/extensions/open-weather.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/_setup/extensions/gnome-tweaks.sh
