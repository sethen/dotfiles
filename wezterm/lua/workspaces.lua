-- the development layout: one workspace per project, built on wezterm's mux api so
-- the whole set survives closing the window.
local wezterm = require('wezterm')

local mux = wezterm.mux

local M = {}

-- configure-user captures this and config.fish exports it, so honour the answer
-- rather than assuming ~/Developer. the mux server inherits hyprland's
-- environment, which will not have it, so the fallback is what usually applies
-- here; without it a missing value would build the whole layout under nil.
local DEVELOPER = os.getenv('DEVELOPER_DIRECTORY') or (wezterm.home_dir .. '/Developer')

-- each command is the tab's process, not text typed into a shell, so the tab is the
-- program rather than a prompt that happens to be running it.
--
-- it still goes through a login fish rather than being exec'd bare. the mux server
-- inherits hyprland's environment, where none of these tools are on PATH; a login
-- fish sources config.fish, which activates mise and puts them there. this holds
-- non-interactively - verified from a bare `env -i` that lazygit, yazi, nvim,
-- docker and lazydocker all resolve, and that herdr-start autoloads as a function.
--
-- the tradeoff: when a program exits, its pane exits with it and the tab closes.
-- to be left at a prompt instead, append `; exec fish -l` to a command below.
--
-- the cd is not redundant. spawn_tab silently ignores its cwd when args is also
-- given - reproduced with three tabs given three different cwds, all of which
-- started in the first window's directory instead. spawn_window does honour it, so
-- only the tabs after the first were affected, which makes it easy to miss. doing
-- the cd inside the command sidesteps that path entirely.
--
-- exec so the program replaces the shell and becomes the pane's own process, which
-- is what puts its name in the tab rather than a generic "fish". herdr-start is a
-- fish function, and exec only replaces the process with an external command, so
-- that one entry opts out with shell_function and runs as a child instead.
local SHELL = '/usr/bin/fish'

local function command_args(spec, cwd)
   if not spec.cmd then
      return nil
   end

   local run = spec.shell_function and spec.cmd or ('exec ' .. spec.cmd)

   return { SHELL, '-l', '-c', string.format("cd '%s'; and %s", cwd, run) }
end

-- a tab entry may carry `splits`: further programs placed beside it in the same
-- tab, left to right, rather than in tabs of their own. each split takes the same
-- fields as a tab (cmd, cwd, shell_function) plus an optional `size`.
--
-- each split divides the pane made before it rather than the primary, so `size` is
-- a fraction of whatever is left to the right, not of the tab. one split at the
-- default 0.5 is an even half; a second at 0.5 halves that half, giving 50/25/25.
-- pass explicit sizes for even thirds.
--
-- splitting is also what makes the new pane active, so the tab would open focused
-- on the last split rather than on its primary program. the primary is reactivated
-- afterwards to undo that.
local function apply_splits(pane, entry, fallback_cwd)
   if not entry.splits then
      return
   end

   local previous = pane

   for _, spec in ipairs(entry.splits) do
      local cwd = spec.cwd or fallback_cwd

      previous = previous:split({
         direction = 'Right',
         size = spec.size or 0.5,
         cwd = cwd,
         args = command_args(spec, cwd),
      })
   end

   pane:activate()
end

-- herdr lives only in main. it is a single global session - one server, one shared
-- agent list, no project anywhere in it - so a copy in every workspace would be the
-- same session shown five times, and five copies of herdr-start would race on that
-- shared list.
--
-- every project workspace gets the same tools, differing only in which agent it
-- carries. the agent runs as a plain tab rather than through herdr, so it is rooted
-- in that project's own codebase; herdr drives one global agent list with no
-- project in it, so routing these through it would give every workspace a view of
-- the same agents.
--
-- lazygit sits beside the agent rather than in a tab of its own: the two are read
-- together, since what the agent just changed is what lazygit is showing. nvim and
-- lazydocker stay full-width tabs - neither is watched while the agent works.
--
-- the shell tab carries no cmd, so it is a plain login fish at the workspace's cwd.
-- last rather than first: a gui attaching lands on the first tab regardless of what
-- mux-startup activated, and landing on nvim is the point of opening a project.
local function project_tabs(agent)
   return {
      { title = 'nvim', cmd = 'nvim -c NvimTreeToggle' },
      { title = 'lazydocker', cmd = 'lazydocker' },
      { title = agent, cmd = agent, splits = { { cmd = 'lazygit' } } },
      { title = 'shell' },
   }
end

-- one workspace per project, plus main for the things that belong to no project.
-- main is config.default_workspace (lua/mux.lua), so it is the one showing when a
-- window attaches.
local WORKSPACES = {
   {
      name = 'main',
      cwd = DEVELOPER,
      tabs = {
         -- shell first, not merely marked focus: activating a tab from mux-startup
         -- does not survive a gui attaching, which lands on the first tab regardless.
         { title = 'shell', focus = true },
         { title = 'herdr', cmd = 'herdr-start', shell_function = true },
         { title = 'yazi', cmd = 'yazi' },

         -- btop watches the whole machine rather than any one project, which is what
         -- puts it here rather than in each workspace.
         { title = 'btop', cmd = 'btop' },
      },
   },
   { name = 'dotfiles', cwd = DEVELOPER .. '/dotfiles', tabs = project_tabs('opencode') },

   -- gem spans two codebases, so its tabs carry their own cwd rather than taking
   -- the workspace's. one lazydocker because the docker daemon is machine-wide, and
   -- it sits in the backend, which is where the compose file lives. no claude here.
   {
      name = 'gem',
      cwd = DEVELOPER .. '/gem-backend',
      tabs = {
         { title = 'nvim-fe', cwd = DEVELOPER .. '/gem-frontend', cmd = 'nvim -c NvimTreeToggle' },
         { title = 'nvim-be', cwd = DEVELOPER .. '/gem-backend', cmd = 'nvim -c NvimTreeToggle' },

         -- the two long-running servers. npm rather than pnpm: the repo has a
         -- pnpm-lock.yaml, but `pnpm run dev` refuses to start with
         -- ERR_PNPM_IGNORED_BUILDS over esbuild's build script, while npm runs vite
         -- straight away. these tabs exec their command, so a failing one takes its
         -- tab down with it rather than leaving the error on screen.
         { title = 'dev-fe', cwd = DEVELOPER .. '/gem-frontend', cmd = 'npm run dev' },
         { title = 'compose-be', cwd = DEVELOPER .. '/gem-backend', cmd = 'docker compose up --build' },
         { title = 'lazydocker', cmd = 'lazydocker' },

         -- one agent per codebase now rather than the single backend one, because
         -- each is paired with the lazygit for the repo it is editing and an agent
         -- rooted in the backend would be sitting next to the frontend's diff.
         {
            title = 'opencode-fe',
            cwd = DEVELOPER .. '/gem-frontend',
            cmd = 'opencode',
            splits = { { cmd = 'lazygit' } },
         },
         {
            title = 'opencode-be',
            cwd = DEVELOPER .. '/gem-backend',
            cmd = 'opencode',
            splits = { { cmd = 'lazygit' } },
         },

         -- spans two codebases, so the shell takes the workspace cwd (the backend)
         -- like lazydocker does, rather than picking one of the two.
         { title = 'shell' },
      },
   },

   { name = 'worth-api', cwd = DEVELOPER .. '/worth-api', tabs = project_tabs('claude') },
}

local function build_workspace(spec)
   local first = spec.tabs[1]
   local first_cwd = first.cwd or spec.cwd
   local tab, pane, window = mux.spawn_window({
      workspace = spec.name,
      cwd = first_cwd,
      args = command_args(first, first_cwd),
   })

   tab:set_title(first.title)
   apply_splits(pane, first, first_cwd)

   local spawned_tabs = { tab }

   for index = 2, #spec.tabs do
      local entry = spec.tabs[index]
      local entry_cwd = entry.cwd or spec.cwd
      local spawned = window:spawn_tab({
         cwd = entry_cwd,
         args = command_args(entry, entry_cwd),
      })

      spawned:set_title(entry.title)

      -- spawn_tab returns only the tab, so the pane to split comes from the tab
      -- itself. it has exactly one at this point, which is that pane.
      apply_splits(spawned:active_pane(), entry, entry_cwd)

      table.insert(spawned_tabs, spawned)
   end

   -- spawn_tab leaves the last tab focused, so the tab to open on is always set
   -- explicitly: whichever entry is marked focus, otherwise the first.
   local focus = 1

   for index, entry in ipairs(spec.tabs) do
      if entry.focus then
         focus = index
      end
   end

   spawned_tabs[focus]:activate()
end

-- mux-startup, not gui-startup. gui-startup fires for every gui process and would
-- also let wezterm spawn a spare window alongside the layout. mux-startup fires
-- once, inside wezterm-mux-server, and only when something connects to the unix
-- domain - which the desktop entry does with `wezterm connect unix`. so the layout
-- is built once per mux server and reattached to after that, rather than rebuilt
-- every time a window opens.
--
-- this handler runs inside the mux server, where the local domain *is* the mux, so
-- the spawns take no domain override and still land in the server. the panes then
-- outlive every window attached to them.
wezterm.on('mux-startup', function()
   for _, spec in ipairs(WORKSPACES) do
      build_workspace(spec)
   end
end)

return M
