#!/bin/zsh

echo ''
header-message "$DISTRO setup"
echo ''

information-message 'installing packages'

# login to github first
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/github-cli.sh

# _setup/packages other packages
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/cmake.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/docker.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/google-chrome.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/kitty.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/nginx.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/ripgrep.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/spotify.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/virtualbox.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/visual-studio-code.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/vlc.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/zsh-autosuggestions.sh

# nvm, node & node modules
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/node.sh

# golang & gopls
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/go.sh

# chruby, ruby-install, ruby & solargraph gem
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/ruby.sh

# rust & rust-analyzer
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/rust.sh

# neovim
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/bob.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/packages/neovim.sh

echo ''
read 'UPGRADE?would you like to upgrade your existing packages? [Yy/Nn] '
echo ''

if [[ $UPGRADE =~ '[Yy]' ]]; then
    success-message 'updating homebrew and upgrading homebrew packages'

    brew update && brew upgrade
fi
