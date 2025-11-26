#!/usr/bin/env fish

# determine os
if string match -q "*Ubuntu*" (uname -a)
  set -gx SYSTEM_OS "ubuntu"
else if string match -q "*Darwin*" (uname -a)
  set -gx SYSTEM_OS "darwin"
else
  set -gx SYSTEM_OS "unknown"
end

# dotfile directories and files
set -gx DOTFILES_DIRECTORY (pwd)
set -gx DOTFILES_CONFIG_DIRECTORY $DOTFILES_DIRECTORY/.config
set -gx DOTFILES_FISH_DIRECTORY $DOTFILES_CONFIG_DIRECTORY/fish
set -gx DOTFILES_FISH_CONFIG_FILE $DOTFILES_FISH_DIRECTORY/config.$SYSTEM_OS.fish
set -gx DOTFILES_FISH_FUNCTIONS_DIRECTORY $DOTFILES_FISH_DIRECTORY/functions

# home level directories and files
set -gx HOME_CONFIG_DIRECTORY $HOME/.config
set -gx HOME_FISH_DIRECTORY $HOME_CONFIG_DIRECTORY/fish
set -gx HOME_FISH_CONFIG_FILE $HOME_FISH_DIRECTORY/config.fish
set -gx HOME_FISH_FUNCTIONS_DIRECTORY $HOME_FISH_DIRECTORY/functions
set -gx HOME_FISH_DARWIN_FUNCTIONS_DIRECTORY $HOME_FISH_DIRECTORY/functions/darwin
set -gx HOME_FISH_DOT_FUNCTIONS_DIRECTORY $HOME_FISH_DIRECTORY/functions/dot
set -gx HOME_FISH_GIT_FUNCTIONS_DIRECTORY $HOME_FISH_DIRECTORY/functions/git
set -gx HOME_FISH_UBUNTU_FUNCTIONS_DIRECTORY $HOME_FISH_DIRECTORY/functions/ubuntu
set -gx HOME_FISH_UTILITIES_FUNCTIONS_DIRECTORY $HOME_FISH_DIRECTORY/functions/utilities

# prepend functions path
set -gp fish_function_path \
  $HOME_FISH_DOT_FUNCTIONS_DIRECTORY \
  $HOME_FISH_GIT_FUNCTIONS_DIRECTORY \
  $HOME_FISH_UTILITIES_FUNCTIONS_DIRECTORY

# delete existing fish functions directory
if test -d "$HOME_FISH_FUNCTIONS_DIRECTORY"
  rm -rf "$HOME_FISH_FUNCTIONS_DIRECTORY"
end

# symlink fish functions directory
if test -d "$DOTFILES_FISH_FUNCTIONS_DIRECTORY"
  ln -sf "$DOTFILES_FISH_FUNCTIONS_DIRECTORY" "$HOME_FISH_FUNCTIONS_DIRECTORY"
end

# delete existing fish config file
if test -f "$HOME_FISH_CONFIG_FILE"
  rm -f "$HOME_FISH_CONFIG_FILE"
end

# symlink dotfiles fish config file
if test -f "$DOTFILES_FISH_CONFIG_FILE"
  ln -sf "$DOTFILES_FISH_CONFIG_FILE" "$HOME_FISH_CONFIG_FILE"
end

header-message "welcome to sethen's dot-launcher for fish shell"

# launch dot launcher
dot-launcher

header-message "thank you for using sethen's dot-launcher for fish shell"
