#!/usr/bin/fish

function dot-launcher
  # install fzf if not present
  if not type -q fzf
    information-message "installing fzf"
    sudo apt update
    sudo apt install -y fzf
  end

  # collect files safely (handle case where glob matches nothing)
  set ALL_DOT_FUNCTIONS
  for DOT_FUNCTION in $HOME_FISH_DOT_FUNCTIONS_DIRECTORY/*.fish
    if test -e "$DOT_FUNCTION"
      set ALL_DOT_FUNCTIONS $ALL_DOT_FUNCTIONS $DOT_FUNCTION
    end
  end

  set DOT_FUNCTIONS ()

  # collect function names
  for DOT_FUNCTION in $ALL_DOT_FUNCTIONS
    if test -f "$DOT_FUNCTION"
      set DOT_FUNCTION_NAME (basename $DOT_FUNCTION .fish)

      # ignore the launcher itself
      if test "$DOT_FUNCTION_NAME" != "dot-launcher"
        set DOT_FUNCTIONS $DOT_FUNCTIONS $DOT_FUNCTION_NAME
      end
    end
  end

  # if no functions found, exit
  if test (count $DOT_FUNCTIONS) -eq 0
    echo "no dot functions found"
    return
  end

  # pick function with fzf
  set SELECTED_DOT_FUNCTION (printf "%s\n" $DOT_FUNCTIONS | fzf --height 15 --reverse --preview "type {}" --prompt "pick a dot function: ")

  if test -n "$SELECTED_DOT_FUNCTION"
    set -l SELECTED_PATH "$HOME_FISH_DOT_FUNCTIONS_DIRECTORY/$SELECTED_DOT_FUNCTION.fish"

    # Only source the function file if needed and it exists
    if not functions -q $SELECTED_DOT_FUNCTION
      if test -f "$SELECTED_PATH"
        source "$SELECTED_PATH"
      else
        echo "function file not found: $SELECTED_PATH"
        return 1
      end
    end

    # heuristic: check if function contains 'argv' or parameters
    set DOT_FUNCTION_DEFINITION (functions $SELECTED_DOT_FUNCTION)

    if string match -q '*argv*' "$DOT_FUNCTION_DEFINITION"; or string match -q '*$argv*' "$DOT_FUNCTION_DEFINITION"
      read -P "enter arguments for $SELECTED_DOT_FUNCTION: " DOT_FUNCTION_ARGUMENTS
      set -l __args (string split " " -- $DOT_FUNCTION_ARGUMENTS)
    else
      set DOT_FUNCTION_ARGUMENTS ""
      set -l __args
    end

    # run function with arguments if any
    if test (count $__args) -gt 0
      $SELECTED_DOT_FUNCTION $__args
    else
      $SELECTED_DOT_FUNCTION
    end
  end
end
