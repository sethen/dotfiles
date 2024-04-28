#!/bin/zsh

export PRESENT_WORKING_DIRECTORY="$(cd "$(dirname "$0")"; pwd)"

# switch shell to zsh
$PRESENT_WORKING_DIRECTORY/lib/switch-shell-to-zsh.sh

# determine current os and export distro
. $PRESENT_WORKING_DIRECTORY/lib/determine-os.sh

# run os and distro specific files
# init
$PRESENT_WORKING_DIRECTORY/os/_init/run.sh
$PRESENT_WORKING_DIRECTORY/$DISTRO/_init/run.sh

# setup
$PRESENT_WORKING_DIRECTORY/os/_setup/run.sh
$PRESENT_WORKING_DIRECTORY/$DISTRO/_setup/run.sh

# reboot system prompt
$PRESENT_WORKING_DIRECTORY/lib/reboot-system-prompt.sh

echo "\nthanks for using sethen's dotfiles\n"

exec zsh
source ~/.zshrc
