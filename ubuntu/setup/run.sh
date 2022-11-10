#!/bin/zsh
header_message 'ubuntu setup'
information_message 'adding repositories'

check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/repositories/emacs.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/repositories/google-chrome.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/repositories/insomnia.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/repositories/visual-studio-code.sh

information_message 'updating packages'

sudo apt update -y

information_message 'removing packages'

sudo apt autoremove -y

information_message 'setup packages'

# setup/packages other packages
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/arc-theme.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/aws.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/cmake.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/emacs-ligature.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/emacs.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gdebi.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gnome-shell-extensions.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gnomeshell-extension-manage.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gnome-tweaks.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/google-chrome.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gparted.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/gpick.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/insomnia.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/kazam.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/mdadm.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/moka-icon-theme.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/spotify.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/virtualbox.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/visual-studio-code.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/vlc.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/zoom.sh

# java setup/packages order matters here
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/jre.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/jdk.sh

# python3 setup/packages order matters here
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/python3.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/setup/packages/python-lsp-server.sh

echo ''
read 'UPGRADE?would you like to upgrade your existing packages? [Yy/Nn] '

if [[ $UPGRADE =~ '[Yy]' ]]; then
	information_message 'upgrading apt packages'

	sudo apt upgrade -y
	sudo apt autoremove -y
fi
