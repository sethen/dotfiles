-- the development layout: one workspace per project, built on wezterm's mux api so
-- the whole set survives closing the window.
local wezterm = require('wezterm')

local mux = wezterm.mux

local M = {}

local DEVELOPER = wezterm.home_dir .. '/Developer'

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
local function project_tabs(agent)
   return {
      { title = 'nvim', cmd = 'nvim -c NvimTreeToggle' },
      { title = 'lazygit', cmd = 'lazygit' },
      { title = 'lazydocker', cmd = 'lazydocker' },
      { title = agent, cmd = agent },
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
      },
   },
   { name = 'dotfiles', cwd = DEVELOPER .. '/dotfiles', tabs = project_tabs('opencode') },

   -- gem spans two codebases, so its tabs carry their own cwd rather than taking
   -- the workspace's. one lazydocker because the docker daemon is machine-wide, and
   -- one opencode by request; both sit in the backend, which is where the compose
   -- file lives. no claude here.
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
         { title = 'lazygit-fe', cwd = DEVELOPER .. '/gem-frontend', cmd = 'lazygit' },
         { title = 'lazygit-be', cwd = DEVELOPER .. '/gem-backend', cmd = 'lazygit' },
         { title = 'lazydocker', cmd = 'lazydocker' },
         { title = 'opencode', cmd = 'opencode' },
      },
   },

   { name = 'worth-api', cwd = DEVELOPER .. '/worth-api', tabs = project_tabs('claude') },
}

local function build_workspace(spec)
   local first = spec.tabs[1]
   local first_cwd = first.cwd or spec.cwd
   local tab, _, window = mux.spawn_window({
      workspace = spec.name,
      cwd = first_cwd,
      args = command_args(first, first_cwd),
   })

   tab:set_title(first.title)

   local spawned_tabs = { tab }

   for index = 2, #spec.tabs do
      local entry = spec.tabs[index]
      local entry_cwd = entry.cwd or spec.cwd
      local spawned = window:spawn_tab({
         cwd = entry_cwd,
         args = command_args(entry, entry_cwd),
      })

      spawned:set_title(entry.title)

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
