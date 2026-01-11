#!/usr/bin/env fish

function dot-launcher
  set -l HOME_FISH_FUNCTIONS

  for fish_function in $HOME_FISH_FUNCTIONS_DIRECTORY/*/**
    if not test -f $fish_function
      continue
    end

    set HOME_FISH_FUNCTIONS $HOME_FISH_FUNCTIONS (basename $fish_function .fish)
  end

  if test (count $HOME_FISH_FUNCTIONS) -eq 0
    echo "no fish functions found"

    return
  end

  set SELECTED (printf "%s\n" $HOME_FISH_FUNCTIONS | fzf --height 15 --reverse --preview 'type {}')

  if test -z "$SELECTED"
    return
  end

  if string match -q '*argv*' (functions $SELECTED)
    read -P "enter arguments for $SELECTED: " ARGS

    $SELECTED (string split ' ' -- $ARGS)
  else
    $SELECTED
  end
end
