-- wezterm is the primary terminal: it draws the windows and multiplexes panes, tabs
-- and sessions on its own. the modules below are split by concern.
local wezterm = require('wezterm')

-- wezterm puts the config directory itself on package.path, but not lua/, so
-- require('appearance') needs this to resolve
package.path = wezterm.config_dir .. '/lua/?.lua;' .. package.path

local config = wezterm.config_builder()

require('appearance').apply(config)
require('mux').apply(config)
require('status').apply(config)
require('keys').apply(config)

-- no .apply: this one only registers the mux-startup handler that builds the
-- development layout. it has to be required here rather than from another module,
-- because wezterm-mux-server loads this same file and needs that handler too.
require('workspaces')

-- lua/keys.lua only adds workspace switching; everything else stays at wezterm's
-- defaults. `wezterm show-keys` prints the current set.

return config
