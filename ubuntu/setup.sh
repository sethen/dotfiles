#!/bin/zsh

header_message 'ubuntu setup'

information_message 'adding repositories'

check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/docker.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/golang.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/google-chrome.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/insomnia.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/moka-icon-theme.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/neovim.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/spotify.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/ukuu.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/yarn.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/repositories/visual-studio-code.sh

information_message 'updating packages'

sudo apt update -y
sudo apt-get install -f

information_message 'installing packages'

check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/arc-theme.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/ccze.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/cmake.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/cowsay.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/docker.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/fortune.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gnome-calculator.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gnome-shell-extension-weather.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gnome-shell-extensions.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gnomeshell-extension-manage.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gnome-tweaks.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gnomeshell-extension-manage.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/golang.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/go-langserver.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/google-chrome.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gparted.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/gpick.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/insomnia.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/jre.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/moka-icon-theme.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/neovim.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/nginx.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/nodejs.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/samba.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/spotify.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/telegram.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/tmux.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/ukuu.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/vim-plug.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/virtualenv.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/visual-studio-code.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/vlc.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/xsel.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/yarn.sh

# rbenv and ruby install order matters here
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/rbenv.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/rails.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/ripgrep.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/solargraph.sh

# lolcat has a dependency of ruby gems
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/ubuntu/install/lolcat.sh

echo ''
read 'UPGRADE?would you like to upgrade your existing packages? [Yy/Nn] '

if [[ $UPGRADE =~ '[Yy]' ]]; then
	information_message 'upgrading apt packages'

	sudo apt upgrade -y
	sudo apt autoremove -y

	echo ''
fi

read 'INSTALL_VIM_PLUG_PLUGINS?would you like to install vim-plug plugins? [Yy/Nn] '

if [[ $INSTALL_VIM_PLUG_PLUGINS =~ '[Yy]' ]]; then
	information_message 'installing vim-plug plugins'

	nvim +'PlugInstall --sync' +qa
fi
