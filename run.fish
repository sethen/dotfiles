#!/usr/bin/env fish

set -l UNAME (uname -a)

switch $UNAME
case "*arch*"
  set -gx SYSTEM_OS "arch"
case "*Darwin*"
  set -gx SYSTEM_OS "darwin"
case "*Ubuntu*"
  set -gx SYSTEM_OS "ubuntu"
end

# dotfiles local references
set -gx DOTFILES_DIRECTORY (pwd)
set -gx DOTFILES_CONFIG_DIRECTORY $DOTFILES_DIRECTORY/.config
set -gx DOTFILES_FISH_DIRECTORY $DOTFILES_CONFIG_DIRECTORY/fish
set -gx DOTFILES_FISH_CONFIG_FILE $DOTFILES_FISH_DIRECTORY/config.$SYSTEM_OS.fish
set -gx DOTFILES_FISH_FUNCTIONS_DIRECTORY $DOTFILES_FISH_DIRECTORY/functions
set -gx DOTFILES_FISH_FUNCTIONS_CORE_DIRECTORY $DOTFILES_FISH_FUNCTIONS_DIRECTORY/core
set -gx DOTFILES_FISH_FUNCTIONS_OS_DIRECTORY $DOTFILES_FISH_FUNCTIONS_DIRECTORY/os/$SYSTEM_OS

# home paths to symlink from dotfiles
set -gx HOME_CONFIG_DIRECTORY $HOME/.config
set -gx HOME_FISH_DIRECTORY $HOME_CONFIG_DIRECTORY/fish
set -gx HOME_FISH_CONFIG_FILE $HOME_FISH_DIRECTORY/config.fish
set -gx HOME_FISH_FUNCTIONS_DIRECTORY $HOME_FISH_DIRECTORY/functions
set -gx HOME_OS_INIT "$SYSTEM_OS-init"

# delete existing fish config file
if test -f $HOME_FISH_CONFIG_FILE
  rm -f $HOME_FISH_CONFIG_FILE
end

# symlink dotfiles fish config file
if test -f $DOTFILES_FISH_CONFIG_FILE
  ln -sf $DOTFILES_FISH_CONFIG_FILE $HOME_FISH_CONFIG_FILE
end

if test -d $HOME_FISH_FUNCTIONS_DIRECTORY
  rm -rf $HOME_FISH_FUNCTIONS_DIRECTORY
end

mkdir $HOME_FISH_FUNCTIONS_DIRECTORY

# symlink core dotfiles fish functions directory
if test -d $DOTFILES_FISH_FUNCTIONS_CORE_DIRECTORY
  ln -sf $DOTFILES_FISH_FUNCTIONS_CORE_DIRECTORY $HOME_FISH_FUNCTIONS_DIRECTORY
end

# symlink os dotfiles fish functions directory
if test -d $DOTFILES_FISH_FUNCTIONS_OS_DIRECTORY
  ln -sf $DOTFILES_FISH_FUNCTIONS_OS_DIRECTORY $HOME_FISH_FUNCTIONS_DIRECTORY
end

# loop through all functions in fish functions directory
for dir in $HOME_FISH_FUNCTIONS_DIRECTORY/*/**/
  if test -d $dir
    set -gp fish_function_path $dir
  end
end

header-message "welcome to sethen's dot-launcher for fish shell"

# run init 
$HOME_OS_INIT

# launch dot launcher
dot-launcher

header-message "thank you for using sethen's dot-launcher for fish shell"
