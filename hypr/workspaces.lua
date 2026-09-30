-- Workspace rules wiki https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- Add your workspace rules here. Increment the workspace number as you go. Do not have duplicate workspaces.
-- no default = true: it would make gaming the startup workspace on the
-- primary monitor and count as its first workspace for the m~N binds below
hl.workspace_rule({ workspace = "name:gaming", monitor = PRIMARY_MONITOR })
-- NUM_WPM workspaces pinned to each monitor, numbered on from
-- the previous one: 1-5 on MONITOR1, 6-10 on MONITOR2
for index, monitor in ipairs({ MONITOR1, MONITOR2 }) do
    for n = 1, NUM_WPM do
        local workspace = (index - 1) * NUM_WPM + n
        hl.workspace_rule({ workspace = tostring(workspace), monitor = monitor, default = n == 1, persistent = true })
    end
end

-- ALT + 1-NUM_WPM jumps to that workspace on the focused monitor (m~N is the
-- Nth workspace of the current monitor)
for n = 1, NUM_WPM do
    hl.bind("ALT + " .. (n % 10), hl.dsp.focus({ workspace = "m~" .. n }))
end

-- For other layouts such as scrolling, see example below
-- hl.workspace_rule({ workspace = "1", monitor = MONITOR1, default = true, persistent = true, layout = "scrolling" })
