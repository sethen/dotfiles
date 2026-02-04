#!/usr/bin/env fish

# determine system operating system
set -l UNAME (uname -a)

switch $UNAME
    case "*arch*"
    set -gx SYSTEM_OS "arch"
    case "*Darwin*"
    set -gx SYSTEM_OS "darwin"
    case "*Ubuntu*"
    set -gx SYSTEM_OS "ubuntu"
end

# set global dotfiles paths
set -gx DOTFILES_DIRECTORY (pwd)
set -gx DOTFILES_OS_DISTRO_DIRECTORY $DOTFILES_DIRECTORY/os/$SYSTEM_OS
set -gx DOTFILES_OS_COMMON_DIRECTORY $DOTFILES_DIRECTORY/os/common

# set global home paths
set -gx HOME_CONFIG_DIRECTORY $HOME/.config
set -gx HOME_FISH_DIRECTORY $HOME_CONFIG_DIRECTORY/fish

# parse flags
argparse 'l/launcher' 'r/reboot' 'u/update' -- $argv
or return

# set run reboot flag
if set -q _flag_reboot
        set -gx RUN_DOTFILES_REBOOT "true"
end

# set run update flag
if set -q _flag_update
        set -gx RUN_DOTFILES_UPDATE "true"
end

# source fish functions
set -l OS_PATHS $DOTFILES_OS_DISTRO_DIRECTORY $DOTFILES_OS_DISTRO_DIRECTORY/**/ $DOTFILES_OS_COMMON_DIRECTORY $DOTFILES_OS_COMMON_DIRECTORY/**/

for dir in $OS_PATHS
        if test -d $dir
        if not contains $dir $fish_function_path
        set -gp fish_function_path $dir
        end
        end
end

header-message "welcome to sethen's dot-launcher for fish shell"

run-$SYSTEM_OS-pre
run-common-pre

if set -q _flag_launcher
        dot-launcher
else
        run-$SYSTEM_OS-all
end

header-message "thank you for using sethen's dot-launcher for fish shell"
