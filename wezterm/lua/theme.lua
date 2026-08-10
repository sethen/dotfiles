-- catppuccin mocha, pinned to an exact palette.
--
-- wezterm ships a built-in 'Catppuccin Mocha' scheme, but it is not the same one:
-- it comes from iTerm2-Color-Schemes and differs from the values below in three ways
-- normal and bright white are swapped, brights 1-6 are lighter tints instead of
-- deeper shades, and selection is inverted (#f5e0dc on #1e1e2e). so the
-- scheme name stays as the base for the odds and ends wezterm colours on its own
-- (splits, scrollbar, compose cursor) and everything below overrides it with the
-- values below.
local M = {}

M.scheme = 'Catppuccin Mocha'

M.colors = {
   foreground = '#cdd6f4',
   background = '#1e1e2e',

   cursor_bg = '#f5e0dc',
   cursor_border = '#f5e0dc',
   cursor_fg = '#1e1e2e',

   selection_bg = '#585b70',
   selection_fg = '#cdd6f4',

   -- palette 0-7
   ansi = {
      '#45475a',
      '#f38ba8',
      '#a6e3a1',
      '#f9e2af',
      '#89b4fa',
      '#f5c2e7',
      '#94e2d5',
      '#a6adc8',
   },

   -- palette 8-15
   brights = {
      '#585b70',
      '#f37799',
      '#89d88b',
      '#ebd391',
      '#74a8fc',
      '#f2aede',
      '#6bd7ca',
      '#bac2de',
   },
}

-- the colours the status bar draws with
M.ui = {
   bg = '#181825',
   dim = '#6c7086',
   normal = '#89b4fa',
   locked = '#f38ba8',
   resize = '#fab387',
   pane = '#cba6f7',
   tab = '#b4befe',
   scroll = '#eba0ac',
   search = '#f9e2af',
   move = '#f5c2e7',
   session = '#94e2d5',
}

-- tab bar colours live on the same table wezterm reads the palette from, so they
-- are set here rather than in status.lua, because assigning config.colors twice would
-- silently drop whichever module ran first
M.colors.tab_bar = {
   background = M.ui.bg,
   active_tab = { bg_color = M.ui.bg, fg_color = M.ui.normal, intensity = 'Bold' },
   inactive_tab = { bg_color = M.ui.bg, fg_color = M.ui.dim },
   inactive_tab_hover = { bg_color = M.ui.bg, fg_color = M.ui.normal },
   new_tab = { bg_color = M.ui.bg, fg_color = M.ui.dim },
   new_tab_hover = { bg_color = M.ui.bg, fg_color = M.ui.normal },
}

return M
