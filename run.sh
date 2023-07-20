#!/bin/zsh

export PRESENT_WORKING_DIRECTORY="$(cd "$(dirname "$0")"; pwd)"

# switch shell to zsh
$PRESENT_WORKING_DIRECTORY/lib/switch-shell-to-zsh.sh

# determine current os and export distro
. $PRESENT_WORKING_DIRECTORY/lib/determine-os.sh

# run os and distro specific files
$PRESENT_WORKING_DIRECTORY/os/bootstrap/run.sh
$PRESENT_WORKING_DIRECTORY/$DISTRO/bootstrap/run.sh
$PRESENT_WORKING_DIRECTORY/$DISTRO/setup/run.sh
$PRESENT_WORKING_DIRECTORY/os/preferences.sh
$PRESENT_WORKING_DIRECTORY/$DISTRO/preferences.sh

# reboot system prompt
$PRESENT_WORKING_DIRECTORY/lib/reboot-system-prompt.sh

echo "\nthanks for using sethen's dotfiles\n"

exec zsh
source ~/.zshrc
