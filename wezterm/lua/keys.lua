-- wezterm's defaults are kept as-is; these are additions, not a replacement.
--
-- workspaces are the one thing with no default binding at all: SwitchToWorkspace,
-- SwitchWorkspaceRelative and ShowLauncher appear nowhere in `wezterm show-keys`,
-- so without these the only way between the project workspaces is the command
-- palette on CTRL+SHIFT+P.
local wezterm = require('wezterm')

local act = wezterm.action

local M = {}

function M.apply(config)
   config.keys = {
      -- fuzzy list of the workspaces lua/workspaces.lua builds
      {
         key = 'o',
         mods = 'CTRL|SHIFT',
         action = act.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES', title = 'workspaces' }),
      },

      -- straight through them in order. CTRL|SHIFT with the arrows is taken by
      -- ActivatePaneDirection and CTRL|SHIFT|ALT by AdjustPaneSize, so the brackets
      -- stay out of the way of both.
      { key = '[', mods = 'CTRL|SHIFT', action = act.SwitchWorkspaceRelative(-1) },
      { key = ']', mods = 'CTRL|SHIFT', action = act.SwitchWorkspaceRelative(1) },
   }
end

return M
