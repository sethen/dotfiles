-- Keybinds added on top of cachyos's binds.lua, which stays stock. loaded last
-- from hyprland.lua, so anything bound here must use a free key: binding one
-- cachyos already uses would register both.

-- ALT + 1-NUM_WPM jumps to that workspace on the focused monitor (m~N is the
-- Nth workspace of the current monitor)
for n = 1, NUM_WPM do
    hl.bind("ALT + " .. (n % 10), hl.dsp.focus({ workspace = "m~" .. n }))
end

-- screenshots, copied to the clipboard and saved to a file: O for a dragged
-- region, P for the whole screen. SUPER + P is cachyos's color picker
hl.bind("SUPER + SHIFT + O", hl.dsp.exec_cmd("noctalia msg screenshot-region"))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen"))
