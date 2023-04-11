#!/bin/zsh

header_message 'ubuntu setup'
information_message 'adding repositories'

check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/repositories/github-cli.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/repositories/google-chrome.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/repositories/visual-studio-code.sh

information_message 'updating packages'

sudo apt update -y

information_message 'removing packages'

sudo apt autoremove -y

information_message 'setup packages'

# login to github first
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/github-cli.sh

# setup/packages other packages
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/arc-theme.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/emacs.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/emacs-ligature.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gnome-shell-extensions.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gnome-tweaks.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gnomeshell-extension-manage.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/google-chrome.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gparted.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gpick.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/kazam.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/mdadm.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/moka-icon-theme.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/nginx.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/ripgrep.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/samba.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/spotify.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/virtualbox.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/visual-studio-code.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/vlc.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/zoom.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/zsh-autosuggestions.sh

# node
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/nodejs.sh

# npm packages
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/typescript.sh

# golang
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/go.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gopls.sh

# ruby
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/chruby.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/ruby-install.sh

# rust
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/rust.sh

echo ''
read 'UPGRADE?would you like to upgrade your existing packages? [Yy/Nn] '

if [[ $UPGRADE =~ '[Yy]' ]]; then
	information_message 'upgrading apt packages'

	sudo apt upgrade -y
	sudo apt autoremove -y
fi
