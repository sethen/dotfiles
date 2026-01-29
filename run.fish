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

# --- dotfiles paths ---
set -gx DOTFILES_DIRECTORY (pwd)
set -gx DOTFILES_FISH_FUNCTIONS_DIRECTORY $DOTFILES_DIRECTORY/fish/functions
set -gx DOTFILES_OS_DISTRO_DIRECTORY $DOTFILES_DIRECTORY/os/$SYSTEM_OS
set -gx DOTFILES_OS_COMMON_DIRECTORY $DOTFILES_DIRECTORY/os/common
set -gx DOTFILES_OS_CONFIG_FILE $DOTFILES_OS_DISTRO_DIRECTORY/config.fish

# --- home paths ---
set -gx HOME_CONFIG_DIRECTORY $HOME/.config
set -gx HOME_FISH_DIRECTORY $HOME_CONFIG_DIRECTORY/fish
set -gx HOME_FISH_CONFIG_FILE $HOME_FISH_DIRECTORY/config.fish
set -gx HOME_FISH_FUNCTIONS_DIRECTORY $HOME_FISH_DIRECTORY/functions
set -gx HOME_MISE_DIRECTORY $HOME_CONFIG_DIRECTORY/mise

# --- symlink config ---
rm -f $HOME_FISH_CONFIG_FILE

if test -f $DOTFILES_OS_CONFIG_FILE
  ln -sf $DOTFILES_OS_CONFIG_FILE $HOME_FISH_CONFIG_FILE
end

# --- symlink global functions ---
rm -rf $HOME_FISH_FUNCTIONS_DIRECTORY

if test -d $DOTFILES_FISH_FUNCTIONS_DIRECTORY
  ln -sf $DOTFILES_FISH_FUNCTIONS_DIRECTORY $HOME_FISH_FUNCTIONS_DIRECTORY
end

if not test -d $HOME_MISE_DIRECTORY
  mkdir -p $HOME_MISE_DIRECTORY
end

set -l OS_PATHS $DOTFILES_OS_DISTRO_DIRECTORY $DOTFILES_OS_DISTRO_DIRECTORY/**/ $DOTFILES_OS_COMMON_DIRECTORY $DOTFILES_OS_COMMON_DIRECTORY/**/

for dir in $OS_PATHS
  if test -d $dir
    set -gp fish_function_path $dir
    for file in $dir/*.fish
      source $file
    end
  end
end

header-message "welcome to sethen's dot-launcher for fish shell"

dot-launcher

header-message "thank you for using sethen's dot-launcher for fish shell"
