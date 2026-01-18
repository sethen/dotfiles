#!/usr/bin/env fish

function dot-launcher
  set -l TARGET_FUNCTIONS

  for func in (functions -n)
    set -l func_info (functions -v $func | string collect)

    if string match -q "*$DOTFILES_DIRECTORY*" "$func_info"
      if test "$func" != "dot-launcher"
        set -a TARGET_FUNCTIONS $func
      end
    end
  end

  if test (count $TARGET_FUNCTIONS) -eq 0
    echo "No local functions found in: $DOTFILES_DIRECTORY"
    return
  end

  set -l SELECTED (printf "%s\n" $TARGET_FUNCTIONS | fzf \
  --height 20 \
  --reverse \
  --border \
  --prompt="🚀 Select Task: " \
  --preview 'set_color yellow; type {}')

  if test -z "$SELECTED"
    return
  end

  if functions $SELECTED | grep -q "argv"
    read -P "⌨️  Enter arguments for $SELECTED: " ARGS
    $SELECTED (string split ' ' -- $ARGS)
  else
    $SELECTED
  end
end
