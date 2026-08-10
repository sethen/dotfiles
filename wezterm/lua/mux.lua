-- session persistence: panes that outlive the window they are shown in.
local M = {}

-- persistence is opt-in per window rather than the default for every window, and
-- that is deliberate.
--
-- with the unix domain as the *default*, every pane runs inside wezterm-mux-server
-- and closing a window only detaches it. the mux then keeps that window forever,
-- and the next launch re-materialises every window it is holding before `wezterm
-- start` adds the one you actually asked for. omarchy's SUPER+RETURN runs
-- `xdg-terminal-exec` -> `wezterm start --cwd=...` on every press, so the count
-- climbs on every press: one window, then two, then three.
--
-- `wezterm connect` takes no --cwd (only `start` does), so pointing the desktop
-- entry at it instead would trade the runaway windows for SUPER+RETURN no longer
-- opening in the focused terminal's directory. leaving the default domain local is
-- what keeps both.
--
-- so: SUPER+RETURN gets one window in the right directory, and a durable session is
-- something you ask for by name with `wezterm connect unix`. set this back to true
-- to make every window mux-backed, and expect the accumulation described above.
local PERSIST_PANES = false

function M.apply(config)
   -- deliberately without connect_automatically. the desktop entry runs
   -- `wezterm connect unix`, and the two together attach this domain twice, which
   -- panics the wayland window code (window.rs:1147) and leaves no window at all.
   config.unix_domains = { { name = 'unix' } }

   if PERSIST_PANES then
      config.default_domain = 'unix'
   end

   -- 'default' shows up in the status bar as-is, so give it something meaningful.
   config.default_workspace = 'main'
end

return M
