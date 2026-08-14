# SethensSuperCode

[nonicons](https://github.com/ya2s/nonicons) with every
[Lucide](https://github.com/lucide-icons/lucide) icon added above it.

| Range | Set | Count |
| --- | --- | --- |
| `f000`–`f1b2` | nonicons | 435 |
| `f2000`–`f26e7` | Lucide | 1768 |

Nonicons keeps its original codepoints, so the neovim devicons in
`nvim/lua/sethen/plugins/` and the bar icons in `quickshell/patches.json` both
address it exactly as before.

## Why Lucide sits above U+FFFF

`wezterm/lua/appearance.lua` puts this font ahead of `JetBrainsMono Nerd Font
Mono` in the fallback chain, so it answers for every codepoint it covers — which
is why that file says it must cover `f000-f1b2` and nothing else. Nerd Fonts
claims `f000-f385` and `f400-f533`, where neovim's devicons live. Putting Lucide
in the BMP made this font answer for octicons and changed every file icon in the
editor. `f2000` is above Material's `f0001-f1af0` and clear of every Nerd Font
range.

Those codepoints need a format 12 cmap subtable, since format 4 cannot address
anything above `U+FFFF`, and they cannot be written as a `\uXXXX` escape in QML —
the patches that use them carry the character itself.

## Licences

- **nonicons** — MIT, © ya2s. <https://github.com/ya2s/nonicons>
- **Lucide** — ISC, © Lucide Contributors, forked from Feather (MIT, © Cole
  Bemis). <https://github.com/lucide-icons/lucide>
