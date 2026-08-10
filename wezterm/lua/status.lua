-- the status bar: mode badge on the left, tab list centered, workspace on the
-- right, pinned to the bottom. colours come from lua/theme.lua.
--
-- the glyphs live in U+F000-U+F1B2, which is the range lua/appearance.lua reserves
-- for SethensSuperCode, so the font stack has to stay in that order for them to
-- resolve. they are written as \u{} escapes rather than literal private-use
-- characters, so an editor or a copy-paste cannot silently mangle them.
local wezterm = require('wezterm')

local theme = require('theme')

local M = {}

local ui = theme.ui

-- lower-left triangle, fading the mode badge into the bar, and its mirror for the
-- workspace badge at the other end
local SEPARATOR_RIGHT = '\u{e0b8}'
local SEPARATOR_LEFT = '\u{e0ba}'

local ZOOM_INDICATOR = ' \u{f070} '

-- keep in step with config.tab_max_width below; the centering math has to render
-- each title the same way format-tab-title does
local TAB_MAX_WIDTH = 24

-- wezterm's own key tables. these are the only two it activates by default, so they
-- are the only modes there is anything true to report. everything else goes
-- straight to the program and the badge stays empty.
local MODES = {
   copy_mode = { label = 'SCROLL', color = ui.scroll, icon = '\u{f056}' },
   search_mode = { label = 'SEARCH', color = ui.search, icon = '\u{f06e}' },
}

-- swapping this for a nerd font icon outside the F000-F1B2 range is not worth it.
-- cod-rocket (U+EB44), cod-terminal (U+EA85), oct-terminal (U+F489) and dev-terminal
-- (U+E795) all rasterise to 11-12 against this one's 11.11, because the ceiling is
-- the cell rather than the font, and the thinner outlines read worse at that size.
local WORKSPACE_ICON = '\u{f076}'

local function current_mode(window)
   local table_name = window:active_key_table()

   return table_name and MODES[table_name] or nil
end

-- the one place a tab title is turned into the string that gets drawn, so the
-- centering math measures what is actually on screen rather than an approximation
local function render_tab_title(title, zoomed, max_width)
   if not title or title == '' then
      title = ''
   end

   if zoomed then
      title = title .. ZOOM_INDICATOR
   end

   -- leave room for the padding added below
   if #title > max_width - 2 then
      title = wezterm.truncate_right(title, max_width - 3) .. '…'
   end

   return ' ' .. title .. ' '
end

-- the tab bar hands format-tab-title a TabInformation, which carries the title and
-- the active pane inline. tabs_with_info hands back a MuxTabInformation instead,
-- which carries neither: only .index, .is_active and a .tab handle to ask. the two
-- are easy to mistake for each other, hence a reader for each.
local function title_of_mux_tab(mux_tab)
   local title = mux_tab:get_title()
   local zoomed = false

   for _, pane in ipairs(mux_tab:panes_with_info()) do
      if pane.is_active then
         zoomed = pane.is_zoomed

         if not title or title == '' then
            title = pane.pane:get_title()
         end
      end
   end

   return title, zoomed
end

-- the retro tab bar lays out left_status, then the tabs, then the right_status, so
-- padding the left status is what shifts the tab list into the middle. returns 0
-- rather than guessing if the window size is not readable.
local function centering_pad(window, left_width)
   local ok, size = pcall(function()
      return window:active_tab():get_size()
   end)

   if not ok or not size or not size.cols then
      return 0
   end

   local tabs_width = 0

   for _, info in ipairs(window:mux_window():tabs_with_info()) do
      local title, zoomed = title_of_mux_tab(info.tab)

      tabs_width = tabs_width + wezterm.column_width(render_tab_title(title, zoomed, TAB_MAX_WIDTH))
   end

   local pad = math.floor((size.cols - tabs_width) / 2) - left_width

   return pad > 0 and pad or 0
end

wezterm.on('update-status', function(window, _)
   local mode = current_mode(window)
   local left = {}
   local left_width = 0

   if mode then
      local badge = ' ' .. mode.icon .. '  ' .. mode.label .. ' '

      left = {
         { Background = { Color = mode.color } },
         { Foreground = { Color = ui.bg } },
         { Attribute = { Intensity = 'Bold' } },
         { Text = badge },
         'ResetAttributes',
         { Background = { Color = ui.bg } },
         { Foreground = { Color = mode.color } },
         { Text = SEPARATOR_RIGHT },
      }

      left_width = wezterm.column_width(badge) + wezterm.column_width(SEPARATOR_RIGHT)
   end

   local pad = centering_pad(window, left_width)

   if pad > 0 then
      table.insert(left, { Background = { Color = ui.bg } })
      table.insert(left, { Text = string.rep(' ', pad) })
   end

   window:set_left_status(wezterm.format(left))

   window:set_right_status(wezterm.format({
      { Background = { Color = ui.bg } },
      { Foreground = { Color = ui.session } },
      { Text = SEPARATOR_LEFT },
      { Background = { Color = ui.session } },
      { Foreground = { Color = ui.bg } },
      { Attribute = { Intensity = 'Bold' } },
      { Text = ' ' .. WORKSPACE_ICON .. '  ' .. window:active_workspace() .. ' ' },
   }))
end)

wezterm.on('format-tab-title', function(tab, _, _, _, _, max_width)
   local title = tab.tab_title

   if not title or title == '' then
      title = tab.active_pane.title
   end

   return render_tab_title(title, tab.active_pane.is_zoomed, max_width)
end)

function M.apply(config)
   config.use_fancy_tab_bar = false
   config.tab_bar_at_bottom = true
   config.hide_tab_bar_if_only_one_tab = false
   config.show_new_tab_button_in_tab_bar = false
   config.tab_max_width = TAB_MAX_WIDTH
end

return M
