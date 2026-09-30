-- Workspace rules wiki https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- Add your workspace rules here. Increment the workspace number as you go. Do not have duplicate workspaces.
hl.workspace_rule({ workspace = "name:gaming", monitor = PRIMARY_MONITOR, default = true })
-- NUM_WPM workspaces pinned to each monitor, numbered on from
-- the previous one: 1-5 on MONITOR1, 6-10 on MONITOR2
for index, monitor in ipairs({ MONITOR1, MONITOR2 }) do
    for n = 1, NUM_WPM do
        local workspace = (index - 1) * NUM_WPM + n
        hl.workspace_rule({ workspace = tostring(workspace), monitor = monitor, default = n == 1, persistent = true })
    end
end

-- For other layouts such as scrolling, see example below
-- hl.workspace_rule({ workspace = "1", monitor = MONITOR1, default = true, persistent = true, layout = "scrolling" })
