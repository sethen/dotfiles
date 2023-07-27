#!/bin/zsh

header-message 'ubuntu setup'
information-message 'adding repositories'

check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/repositories/github-cli.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/repositories/google-chrome.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/repositories/visual-studio-code.sh

information-message 'updating packages'

sudo apt update -y

information-message 'removing packages'

sudo apt autoremove -y

information-message 'setup packages'

# login to github first
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/github-cli.sh

# setup/packages other packages
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/arc-theme.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/emacs.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/emacs-ligature.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gnome-shell-extensions.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gnome-tweaks.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gnomeshell-extension-manage.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/google-chrome.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gparted.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gpick.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/kazam.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/mdadm.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/moka-icon-theme.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/nginx.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/ripgrep.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/spotify.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/virtualbox.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/visual-studio-code.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/vlc.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/zoom.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/zsh-autosuggestions.sh

# node manager & node
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/nvm.sh

# source nvm
. $NVM_DIRECTORY/nvm.sh

# npm packages
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/bash-language-server.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/dockerfile-language-server.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/typescript.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/typescript-language-server.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/vscode-langservers-extracted.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/yaml-language-server.sh

# golang
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/go.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gopls.sh

# ruby
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/chruby.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/ruby-install.sh

# source chruby
. $CHRUBY_SHELL_FILE
chruby $RUBY_VERSION

check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/ruby.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/solargraph.sh

# rust
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/rust.sh
check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/rust-analyzer.sh

echo ''
read 'UPGRADE?would you like to upgrade your existing packages? [Yy/Nn] '

if [[ $UPGRADE =~ '[Yy]' ]]; then
    information-message 'upgrading apt packages'

    sudo apt upgrade -y
    sudo apt autoremove -y
fi
