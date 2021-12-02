#!/bin/zsh
header_message 'ubuntu setup'
information_message 'adding repositories'

check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/docker.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/emacs-snapshot.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/github-cli.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/google-chrome.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/insomnia.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/visual-studio-code.sh

information_message 'updating packages'

sudo apt update -y

information_message 'removing packages'

sudo apt autoremove -y

information_message 'installing packages'

# install github-cli and add ssh key first
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/github-cli.sh

# install other packages
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/arc-theme.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/aws.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/ccze.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/cmake.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/cowsay.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/docker.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/docker-compose.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/dotnet-core.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/emacs-ligature.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/emacs-snapshot.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/exuberant-ctags.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/fortune.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gdebi.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gnome-calculator.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gnome-shell-extensions.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gnomeshell-extension-manage.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gnome-tweaks.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/golang.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gopls.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/google-chrome.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gparted.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gpick.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/insomnia.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/kazam.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/mdadm.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/moka-icon-theme.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/nginx.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/mysql-server.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/rust-analyzer.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/samba.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/spotify.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/telegram.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/tmux.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/trash-cli.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/virtualenv.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/visual-studio-code.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/vlc.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/xsel.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/zoom.sh

# java install order matters here
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/jre.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/jdk.sh

# nodejs install order matters here
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/nodejs.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/npm.sh

# python3 install order matters here
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/python3.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/buku.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/python-lsp-server.sh

# rbenv and ruby install order matters here
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/rbenv.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/rails.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/ripgrep.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/tmuxinator.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/solargraph.sh

# typescript
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/typescript.sh

# lolcat has a dependency of ruby gems
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/lolcat.sh

echo ''
read 'UPGRADE?would you like to upgrade your existing packages? [Yy/Nn] '

if [[ $UPGRADE =~ '[Yy]' ]]; then
	information_message 'upgrading apt packages'

	sudo apt upgrade -y
	sudo apt autoremove -y
fi
