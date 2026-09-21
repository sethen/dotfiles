#!/usr/bin/env sh
# type-to-filter over the sessions, and switch to the chosen one.
#
# kitty's built-in goto_session picker renders a numbered list through the hints
# kitten rather than a filter, the same limitation select_tab has. This lists the
# session files directly and marks the ones already running, which `kitty @ ls`
# reports through each window's session_name.
set -eu

dir="${KITTY_CONFIG_DIRECTORY:-$HOME/.config/kitty}/sessions"
[ -d "$dir" ] || exit 0

# names of sessions that already have a window
running=$(kitty @ ls 2>/dev/null \
  | jq -r '[.[] | .tabs[] | .windows[]? | .session_name // empty] | unique | .[]' \
  || true)

rows=$(
  for f in "$dir"/*.kitty-session; do
    [ -e "$f" ] || continue
    name=$(basename "$f" .kitty-session)
    mark='  '
    for r in $running; do
      [ "$r" = "$name" ] && mark='● '
    done
    printf '%s\t%s%s\n' "$name" "$mark" "$name"
  done
)
[ -n "$rows" ] || exit 0

sel=$(printf '%s\n' "$rows" \
  | fzf --delimiter='\t' --with-nth=2.. \
        --prompt='session  ' --pointer='▸' \
        --height=100% --layout=reverse --info=inline \
        --color='bg+:#313244,fg+:#cdd6f4,hl:#89b4fa,hl+:#89b4fa,prompt:#94e2d5,pointer:#f5c2e7,border:#45475a' \
        --border=rounded) || exit 0

[ -n "$sel" ] || exit 0
name=$(printf '%s' "$sel" | cut -f1)
kitty @ action goto_session "sessions/$name.kitty-session"
