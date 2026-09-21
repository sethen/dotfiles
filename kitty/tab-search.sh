#!/usr/bin/env sh
# type-to-filter across every tab in every session.
#
# kitty's built-in select_tab is a numbered list, not a filter: choose_entry()
# renders through the hints kitten, so you pick an index rather than typing a
# name. This is the fuzzy version. Bound to ctrl+shift+space, launched as an
# overlay so it borrows the current window rather than opening a new one.
#
# session_name is carried on windows rather than tabs in `kitty @ ls`, so it is
# read off the tab's first window.
set -eu

sel=$(
  kitty @ ls | jq -r '
    .[] | .tabs[] |
      ((.windows[0].session_name // "") | if . == "" then "" else . + " / " end) as $sess |
      [ (.id | tostring)
      , ($sess + .title + (if .is_active then "  ●" else "" end))
      ] | @tsv
  ' | fzf --delimiter='\t' --with-nth=2.. \
          --prompt='tab  ' --pointer='▸' \
          --height=100% --layout=reverse --info=inline \
          --color='bg+:#313244,fg+:#cdd6f4,hl:#89b4fa,hl+:#89b4fa,prompt:#94e2d5,pointer:#f5c2e7,border:#45475a' \
          --border=rounded
) || exit 0

[ -n "$sel" ] || exit 0
kitty @ focus-tab --match "id:$(printf '%s' "$sel" | cut -f1)"
