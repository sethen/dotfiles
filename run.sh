#!/bin/zsh

export PRESENT_WORKING_DIRECTORY="$(cd "$(dirname "$0")"; pwd)"

# switch shell to zsh
$PRESENT_WORKING_DIRECTORY/lib/switch-shell-to-zsh.sh

# determine current os and export distro
. $PRESENT_WORKING_DIRECTORY/lib/determine-os.sh

# determine current desktop
. $PRESENT_WORKING_DIRECTORY/lib/determine-desktop.sh

# run os and distro specific files

# init
$PRESENT_WORKING_DIRECTORY/os/_init/run.sh
$PRESENT_WORKING_DIRECTORY/distro/_init/run.sh
$PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_init/run.sh

# setup
$PRESENT_WORKING_DIRECTORY/os/_setup/run.sh
$PRESENT_WORKING_DIRECTORY/distro/_setup/run.sh
$PRESENT_WORKING_DIRECTORY/distro/$DISTRO/_setup/run.sh

# this doesn't matter for macOS but for linux we need to run this
if [[ -n $DESKTOP ]]; then
  $PRESENT_WORKING_DIRECTORY/desktop/$DESKTOP/_setup/run.sh
fi

# finalize
$PRESENT_WORKING_DIRECTORY/os/_finalize/run.sh

echo "\nthanks for using sethen's dotfiles\n"

exec zsh
. ~/.zshrc
