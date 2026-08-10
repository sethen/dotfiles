-- font, theme and window chrome.
local wezterm = require('wezterm')

local theme = require('theme')

local M = {}

-- SethensSuperCode has to answer for U+F000-U+F1B2 and nothing else. wezterm has no
-- codepoint->font map, so that comes out of fallback ordering, and ordering only
-- works if the primary font carries no nerd font glyphs of its own: a patched
-- primary answers for F000-F1B2 first and SethensSuperCode never gets a turn. hence
-- plain JetBrains Mono at the front (ttf-jetbrains-mono), patched only later.
-- the icons cannot be drawn larger than the text around them, and it is worth
-- recording what was actually tried so it is not attempted a third time. every
-- lever below was set together, at scale 2.0 and again at 2.5, and measured in the
-- status bar and in the terminal body:
--
--   { family = 'SethensSuperCode', scale = 2.5 }
--   use_cap_height_to_scale_fallback_fonts = false
--   allow_square_glyphs_to_overflow_width = 'Always'
--
-- the rendered glyph is the same size in every combination, including next to
-- plain text in the body. wezterm accepts scale without complaint, but everything
-- on the grid is rasterised into a fixed cell derived from the primary font.
-- growing the icons means growing the cell - font_size or line_height - which
-- grows the text with it. the only bar-local escape is use_fancy_tab_bar with its
-- own window_frame.font_size, which enlarges the whole bar rather than the icons.
--
-- one thing does make them bigger, and it is still not usable. these glyphs are
-- square, so a single cell caps them by width rather than height, and declaring the
-- range double-width lifts that cap - measured 11.11 -> 16.0 glyph height on U+F076,
-- a 44% increase, without touching a letter:
--
--   config.cell_widths = { { first = 0xf000, last = 0xf1b2, width = 2 } }
--
-- but cell_widths is global rather than per-surface. those codepoints then take two
-- columns inside every TUI as well, and neovim's icons stop rendering entirely. the
-- status bar is not worth breaking the editor for.
--
-- also ruled out: lowering head.unitsPerEm, OS/2 sCapHeight, or the declared ascent
-- all change nothing, because wezterm ignores a fallback font's declared metrics
-- when sizing it. that is also why redrawing the glyphs larger in the font does not
-- help - it is the same edit as lowering unitsPerEm, which measured +4%.
local FONTS = {
   'JetBrains Mono',               -- unpatched; also sets the cell metrics
   'SethensSuperCode',             -- covers U+0020 and U+F000-U+F1B2, nothing else
   'JetBrainsMono Nerd Font Mono', -- every other nerd font range
   'Symbols Nerd Font',
   'Noto Color Emoji',
}

function M.apply(config)
   config.font = wezterm.font_with_fallback(FONTS)
   config.font_size = 13.0

   -- the command palette (CTRL+SHIFT+P), the character picker and the pane selector
   -- are gui overlays rather than terminal cells, so their font size is independent
   -- of font_size above and of the cell. that also makes them the one place icons
   -- can genuinely be drawn larger - see the note above ICON handling.
   config.command_palette_font = wezterm.font_with_fallback(FONTS)
   config.command_palette_font_size = 13.0
   config.command_palette_bg_color = theme.ui.bg
   config.command_palette_fg_color = theme.colors.foreground
   config.command_palette_rows = 14

   -- wezterm only takes a multiplier for cell height. nudge this if the leading
   -- reads too tight or too loose.
   config.line_height = 1.15

   -- see lua/theme.lua: the scheme is the base, config.colors pins it to the exact
   -- palette
   config.color_scheme = theme.scheme
   config.colors = theme.colors

   -- hyprland draws no server-side decorations and omarchy expects none, so keep
   -- the resize edges and drop the titlebar wezterm would otherwise draw itself
   config.window_decorations = 'RESIZE'
   config.window_padding = { left = 8, right = 8, top = 6, bottom = 0 }
   config.adjust_window_size_when_changing_font_size = false
   config.enable_wayland = true

   -- panes live in the mux server (see lua/mux.lua), so closing a window detaches
   -- rather than kills and there is nothing left to confirm
   config.window_close_confirmation = 'NeverPrompt'

   -- wezterm's default cursor blink fades in and out; the Constant easings turn
   -- that back into a hard on/off blink.
   config.default_cursor_style = 'BlinkingBlock'
   config.cursor_blink_ease_in = 'Constant'
   config.cursor_blink_ease_out = 'Constant'

   config.scrollback_lines = 10000
   config.audible_bell = 'Disabled'

   -- packaged through pacman, so wezterm should not go looking for its own updates
   config.check_for_updates = false

   -- needs the wezterm terminfo, which the pacman package installs
   config.term = 'wezterm'

   -- login shell so config.fish runs and mise activates. lua/workspaces.lua sends
   -- mise-managed commands into these shells and depends on that.
   config.default_prog = { '/usr/bin/fish', '-l' }
end

return M
