#!/usr/bin/fish

function dot-launcher
  if not type -q fzf
    echo "installing fzf"

    sudo apt update
    sudo apt install -y fzf
  end

  set FUNCTION_DIRS \
  $HOME_FISH_DOT_FUNCTIONS_DIRECTORY \
  $HOME_FISH_GIT_FUNCTIONS_DIRECTORY \
  $HOME_FISH_UTILITIES_FUNCTIONS_DIRECTORY

  if test "$SYSTEM_OS" = "darwin"
    set -a FUNCTION_DIRS $HOME_FISH_DARWIN_FUNCTIONS_DIRECTORY
  else if test "$SYSTEM_OS" = "ubuntu"
    set -a FUNCTION_DIRS $HOME_FISH_UBUNTU_FUNCTIONS_DIRECTORY
  end

  set ALL_FUNCTIONS
  set FUNCTION_NAMES

  for DIR in $FUNCTION_DIRS
    if test -d "$DIR"
      for FILE in $DIR/*.fish
        if test -f "$FILE"
          source "$FILE"

          set ALL_FUNCTIONS $ALL_FUNCTIONS $FILE
          set NAME (basename $FILE .fish)

          if test "$NAME" != "dot-launcher"
            set FUNCTION_NAMES $FUNCTION_NAMES $NAME
          end
        end
      end
    end
  end

  if test (count $FUNCTION_NAMES) -eq 0
    echo "no functions found in: $FUNCTION_DIRS"
    return
  end

  set SELECTED (printf "%s\n" $FUNCTION_NAMES | fzf --height 15 --reverse --preview "type {}" --prompt "Pick a function: ")

  if test -z "$SELECTED"
    return
  end

  set DEF (functions $SELECTED)
  if string match -q '*argv*' "$DEF"
    read -P "enter arguments for $SELECTED: " ARGS
    set __args (string split " " -- $ARGS)
  else
    set __args
  end

  if test (count $__args) -gt 0
    $SELECTED $__args
  else
    $SELECTED
  end
end
