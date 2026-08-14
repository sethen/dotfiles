# Sethen's Dotfiles

> One Fish-powered installer that bootstraps a complete development environment on macOS, Arch (Omarchy/Hyprland), and Ubuntu.

These are my personal dotfiles. They take a bare machine and turn it into a fully configured development environment: shell, prompt, terminal, editor, language toolchains, and desktop apps. Everything is driven by a single `run.fish` entry point that detects your OS and runs the right steps. Take and use anything you want.

## Table of Contents

- [Highlights](#highlights)
- [Supported Platforms](#supported-platforms)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [How It Works](#how-it-works)
- [What Gets Installed](#what-gets-installed)
- [Configuration Tour](#configuration-tour)
- [Symlink Map](#symlink-map)
- [Desktop Environment (Omarchy/Hyprland)](#desktop-environment-omarchyhyprland)
- [Custom Fish Functions](#custom-fish-functions)
- [Environment Variables](#environment-variables)
- [Advanced Usage](#advanced-usage)
- [Customization](#customization)
- [Project Structure](#project-structure)
- [Troubleshooting](#troubleshooting)

## Highlights

- **One installer, three operating systems.** A single `fish run.fish` detects macOS, Omarchy (Arch/Hyprland), or Ubuntu and runs the matching scripts. Shared steps live in `os/common`; platform-specific steps live under `os/darwin`, `os/omarchy`, and `os/ubuntu`.
- **Phase-based and idempotent.** Setup runs in `pre`, `main`, and `post` phases. Re-running is safe: symlinks use `ln -sfv`, and installers check before reinstalling.
- **One toolchain manager.** Almost every CLI tool and language runtime is pinned in `mise/mise.toml` and installed by [mise](https://mise.jdx.dev), so the same versions land on every machine.
- **Catppuccin Mocha everywhere.** WezTerm, Starship, Neovim, Yazi, and Opencode all share the same palette.
- **A custom Nerd Font.** `SethensSuperCode.ttf` carries the icon glyphs used across the terminal, prompt, and editor.
- **Interactive or hands-off.** Run the whole thing automatically, or use `--launcher` to pick individual steps from a filterable menu.

## Supported Platforms

| Platform | Base requirement |
|----------|------------------|
| **macOS (Darwin)** | A working macOS install. Homebrew is installed for you if missing. |
| **Omarchy (Hyprland)** | A base Arch Linux system with Hyprland installed via [Omarchy](https://github.com/basecamp/omarchy). |
| **Ubuntu** | Ubuntu 24.10+ with an internet connection. |

## Prerequisites

| Requirement | Installation |
|------------|--------------|
| **Fish Shell** | Arch: `sudo pacman -S fish` <br> macOS: `brew install fish` <br> Ubuntu: `sudo apt install fish` |
| **Git** | Usually pre-installed; otherwise use your package manager. |

## Quick Start

```bash
# 1. Clone the repository
git clone <your-repo-url> ~/Developer/dotfiles
cd ~/Developer/dotfiles

# 2. Set your git identity (required for commits)
git config user.name "Your Name"
git config user.email "your.email@example.com"

# 3. Run the setup
fish run.fish              # Full automated setup
fish run.fish --launcher   # Interactive menu (pick individual steps)
```

Flags can be combined:

| Flag | Effect |
|------|--------|
| `-l`, `--launcher` | Open the interactive `gum` menu instead of running everything. |
| `-u`, `--update` | Run an update pass: the system package manager (e.g. `brew update && brew upgrade` on macOS) plus `mise upgrade`. Without it, tools are only installed when missing, never bumped. Note that `mise self-update` runs on every setup regardless of this flag. |
| `-r`, `--reboot` | Reboot after setup completes. |

## How It Works

### Entry point: `run.fish`

`run.fish` is the single entry point. It:

1. **Detects the OS** from `uname` and sets `SYSTEM_OS` to `darwin`, `omarchy`, or `ubuntu`.
2. **Sets global paths** (`DOTFILES_DIRECTORY`, `HOME_CONFIG_DIRECTORY`, and friends).
3. **Loads Fish functions** by adding every `os/<platform>` and `os/common` subdirectory to `fish_function_path`, so each `install-*` / `symlink-*` / helper function becomes callable.
4. **Runs the phases** for your platform.

### Setup phases

The installer is organized into three phases so that prerequisites are always in place before the things that depend on them:

```
run.fish
├── Pre Phase (os/common/pre, os/<platform>/pre)
│   ├── Switch the login shell to fish
│   ├── Create directories (~/.config, ~/Developer, ~/.config/mise, ...)
│   ├── Symlink every config file/directory into place
│   ├── Install mise (curl) and add it to PATH for the run
│   ├── mise self-update → always; refreshes the registry compiled into mise
│   ├── mise install   → installs all tools from mise/mise.toml
│   ├── mise upgrade   → only with --update; bumps `latest` specs to newest
│   ├── verify-mise-tools → fails loudly if a requested tool never installed
│   ├── Install herdr agent integrations (claude, opencode)
│   └── Authenticate with GitHub (ssh key check, else `gh auth login`)
├── Main Phase (os/common/main, os/<platform>/main)
│   ├── Install OS packages (brew / pacman / apt / snap / flatpak)
│   ├── Install language servers (via bun)
│   └── Clone repositories (dotfiles, wallpapers)
└── Post Phase (os/common/post)
    └── Final configuration
```

Why this shape? The phase split keeps ordering correct (mise exists before `mise install`, configs are symlinked before tools read them), and the `common` vs per-platform split means a tool only needs documenting once while platform quirks stay isolated.

## What Gets Installed

### Development tools (via mise)

`mise/mise.toml` is the source of truth for tool versions. `mise install` reads it and installs everything below.

Note that `mise install` is not an upgrade: a tool that is already installed satisfies a `latest` spec indefinitely, so re-running setup will never move it forward. Pass `-u` / `--update` (or run `mise upgrade` yourself) to bump versions. `mise outdated` shows what is behind.

`mise self-update` runs on every setup, before anything installs through mise. This is not cosmetic: mise's tool registry is compiled into the mise binary, so a mise older than a tool's registry entry cannot resolve that tool by name and `mise install` fails identically on every run. `verify-mise-tools` runs after the install pass and reports anything in `mise.toml` that never landed, since `mise install` exits 0 even when a tool is missing.

**Languages & runtimes**

| Tool | Description |
|------|-------------|
| bun | JavaScript/TypeScript runtime |
| node | Node.js (LTS) |
| python | Python |
| ruby | Ruby (uses precompiled binaries; `compile = false`) |
| go | Go toolchain |
| rust | Rust toolchain with cargo |
| java | Java JDK |
| dotnet | .NET SDK |
| zig | Zig compiler |
| clojure | Clojure |
| erlang | Erlang/OTP |

**Build & parsing**

| Tool | Description |
|------|-------------|
| cmake | Cross-platform build system |
| tree-sitter | Incremental parser toolkit |

**Containers & infrastructure**

| Tool | Description |
|------|-------------|
| docker-cli | Docker CLI |
| docker-compose | Docker Compose |
| kubectl | Kubernetes CLI |
| terraform | Infrastructure as code |

**CLI utilities**

| Tool | Description |
|------|-------------|
| fd | Fast file finder |
| fzf | Fuzzy finder |
| ripgrep | Fast line-oriented search |
| jq | JSON processor (required by `herdr-start` and `create-agent-workspace`) |
| gum | Pretty interactive shell scripts |
| starship | Shell prompt |
| yazi | Terminal file manager |
| neovim | Modern Vim editor |
| gh | GitHub CLI |
| mysql | MySQL client |

**Terminal UIs & AI**

| Tool | Description |
|------|-------------|
| btop | TUI for system resources |
| lazygit | TUI for Git |
| lazydocker | TUI for Docker |
| lazyssh | SSH manager |
| crush | AI coding agent |
| opencode | AI coding assistant |
| claude | Anthropic's official CLI for Claude (registry alias of `claude-code`; declare only one of the two) |

### Language servers (via bun)

Installed during the main phase for editor LSP support: `bash-language-server`, `fish-lsp`, `typescript` + `typescript-language-server`, `vscode-langservers-extracted`, and `yaml-language-server`.

### Platform packages

Cross-platform apps appear in more than one table on purpose: each OS installs them through its native package manager.

**macOS (Homebrew)**

| CLI (`brew`) | GUI (`brew --cask`) |
|--------------|---------------------|
| fortune, git, gnupg, nginx | brave-browser, wezterm, font-jetbrains-mono, spotify, virtualbox |

**Omarchy (pacman / yay)**

brave, vlc, virtualbox, postgresql, nginx, ffmpeg, gparted, gpick, font-manager, grub, mdadm, openssh, ca-certificates, curl, fortune-mod, wezterm-nightly-bin, ttf-jetbrains-mono

> WezTerm is a system package rather than a mise tool on purpose: mise has no registry entry for it, and the `ubi`/`github` backends cannot install it either, because upstream publishes only per-distro debs, rpms and an AppImage with no generic Linux tarball. A real package also supplies the terminfo, the icon and `wezterm-mux-server`.
>
> On Omarchy it comes from `wezterm-nightly-bin` (AUR), not `extra/wezterm`. The repo package is pinned to `20240203`, upstream's last tagged release, and its Wayland backend never commits a buffer under Hyprland 0.56: the process starts, OpenGL initializes and the shell renders, but the surface is never mapped, so the terminal simply never appears. Reproducible with `wezterm-gui -n`, so it is the binary and not the config. `enable_wayland = false` and `front_end = "WebGpu"` do not work around it. The nightly provides/conflicts `wezterm`; if `extra/wezterm` is ever installed the run aborts, since pacman raises that conflict as a `y/N` prompt that `--noconfirm` answers with the default `N`. Remove it with `sudo pacman -R wezterm` and re-run.

**Ubuntu (apt / snap / flatpak)**

| Source | Packages |
|--------|----------|
| apt | brave-browser, vlc, virtualbox, postgresql, nginx, gparted, gpick, font-manager, fonts-jetbrains-mono, autoconf, bison, build-essential, ca-certificates, gnupg, gnome-tweaks, lsb-release, mdadm, ncurses, fortune-mod |
| snap | discord, spotify |
| flatpak | zen-browser, flatpak |
| custom | wezterm (`.deb`), White Sur icon theme (git) |

> The GitHub CLI (`gh`) is installed through mise, not a system package manager, so it is the same version on every platform.

## Configuration Tour

### Fish shell

`config.fish` sets up the interactive shell:

- Exports `DEVELOPER_DIRECTORY` and `BUN_INSTALL`, and puts `~/.bun/bin`, `~/.local/bin`, and Homebrew on `PATH`.
- Activates mise when present (`if type -q mise`).
- For interactive sessions, initializes `starship` (guarded by `type -q`).
- Greeting comes from `fortune`.

### Starship prompt

Minimal, fast prompt using the Catppuccin Mocha palette. Shows user, directory, language versions (c, dotnet, golang, nodejs, python, ruby, rust), and git branch/status.

### WezTerm terminal

The primary terminal. WezTerm draws the windows and multiplexes panes, tabs, workspaces and detachable sessions in one process.

Keybindings are WezTerm's defaults; `wezterm/lua/keys.lua` only adds workspace switching, which has no default binding of any kind. `CTRL+SHIFT+O` lists the workspaces, `CTRL+SHIFT+[` and `]` step through them, and `CTRL+SHIFT+P` is the command palette. Run `wezterm show-keys` for the rest.

- `wezterm/wezterm.lua`: entry point; puts `lua/` on `package.path` and applies each module
- `wezterm/lua/theme.lua`: Catppuccin Mocha, pinned to an exact palette. WezTerm's bundled `Catppuccin Mocha` is a different port. It swaps normal and bright white, lightens brights 1-6, and inverts selection, so the scheme name is only the base and these values override it.
- `wezterm/lua/appearance.lua`: font, theme and window chrome. The font stack leads with unpatched `JetBrains Mono` so the nerd font ranges fall through to `SethensSuperCode`; WezTerm has no codepoint-to-font map, so that ordering is what reserves U+F000-U+F1B2 for it.
- `wezterm/lua/mux.lua`: the unix domain is configured but is deliberately *not* the default domain. Run `wezterm connect unix` when you want a session that outlives its window; Making it the default instead means closing a window only detaches it, the mux keeps that window forever, and every later launch re-materializes all of them before `wezterm start` adds the one you asked for, so `SUPER+RETURN` opens one window, then two, then three. Pointing the desktop entry at `wezterm connect` instead would stop that, but `connect` takes no `--cwd`, so `SUPER+RETURN` would stop opening in the focused terminal's directory. The domain deliberately omits `connect_automatically`: combined with the desktop entry's `wezterm connect unix` it attaches twice and panics the Wayland window code (`window.rs:1147`), leaving no window at all.
- `wezterm/lua/status.lua`: bar pinned to the bottom - mode badge left, tab list centered, workspace right. The badge only appears in `copy_mode` and `search_mode`, WezTerm's only default key tables, so it never claims a mode that does not exist. Centering pads the left status by the measured width of the rendered tab titles; note that `format-tab-title` receives a `TabInformation` while `tabs_with_info()` returns `MuxTabInformation`, which carry different fields.
- `wezterm/lua/workspaces.lua`: `dotfiles` and `worth-api` each get `nvim`, `lazydocker` and one agent - `opencode` and `claude` respectively - with `lazygit` split in beside that agent; `gem` spans both gem repos with `nvim-fe`, `nvim-be`, `dev-fe` (`npm run dev`), `compose-be` (`docker compose up --build`), one `lazydocker`, and an `opencode-fe` and `opencode-be` tab that each pair that repo's `opencode` with its own `lazygit` beside it; `main` holds what belongs to no project (`herdr`, `shell`, `yazi`, `btop`). Tabs may carry their own `cwd`, which is what lets `gem` hold two codebases at once. A tab entry may also carry `splits`, a list of programs placed beside it in the same tab, left to right; each takes the same fields as a tab plus an optional `size`, and each divides the pane made before it rather than the primary, so `size` is a fraction of what is left to the right. Splitting makes the new pane active, so the primary is reactivated afterwards and the tab opens on its own program. The agents are plain panes rather than herdr agents, so each is rooted in its own codebase; herdr is one global session with one shared agent list and no project in it, so routing them through it would give every workspace a view of the same agents. That is also why `herdr` is only in `main`. Built on `mux-startup` so it lands in `wezterm-mux-server` and survives closing the window; not `gui-startup`, which fires per GUI process and lets wezterm spawn a spare window alongside the layout. Each command is its pane's own process via `exec`, run through a login `fish` so mise is on `PATH`. The command `cd`s itself because `spawn_tab` silently ignores its `cwd` when `args` is also given, while `spawn_window` honours it. A pane closes when its program exits, and a tab closes with its last pane. `wezterm-restart` tears down the mux server so the layout rebuilds.
- `xdg/xdg-terminals.list`: names WezTerm as the terminal `xdg-terminal-exec` should pick, which is what Omarchy's `SUPER+RETURN` and its launcher call, with Alacritty second as the fallback. Without it the choice among the installed `TerminalEmulator` entries is unspecified. It sits outside `wezterm/` because it is a system-level choice of terminal rather than WezTerm configuration.
- `wezterm/desktop/org.wezfurlong.wezterm.desktop` and `wezterm/desktop/wezterm-open`: the entry shadows the packaged one and runs the `wezterm-open` wrapper, symlinked into `~/.local/bin`. Opened bare the wrapper runs `wezterm connect unix`, attaching the layout; handed a command it runs `wezterm start`, a plain window. Both are needed because Omarchy's `omarchy-launch-tui` and `omarchy-launch-floating-terminal-with-presentation` call `xdg-terminal-exec --app-id=... -e <command>` for the update prompt and every TUI menu, and `wezterm connect` rejects `-e` outright, so pointing `Exec` straight at it meant those never opened. Using `connect` for the command case instead would attach the unix domain and re-materialize every workspace in a second set of windows. `X-TerminalArgDir` is deliberately absent: passing `--cwd` would make every `SUPER+RETURN` look like a command invocation and skip the layout, and `xdg-terminal-exec` chdirs before exec anyway.

### Yazi file manager

Config in `yazi/`:

- `yazi.toml`: manager settings (permission line mode, show hidden, show symlinks)
- `theme.toml`: selects the `catppuccin-mocha` flavor and defines a large icon table (per-extension glyphs and colors)
- `flavors/catppuccin-mocha.yazi/`: the installed flavor package: `flavor.toml` (UI colors) and `tmtheme.xml` (syntax highlighting for the preview pane)

### Neovim

A full Lua configuration under `nvim/lua/sethen/` using `lazy.nvim`:

- **Core** (`core/`): options, keymaps, LSP setup, autocommands, constants.
- **Plugins** (`plugins/`): one file per plugin area.

Highlights: catppuccin theme, lualine, nvim-tree, telescope (+ fzf-native), treesitter, blink-cmp completion, mason, gitsigns, oil, which-key, todo-comments, and AI integrations (copilot, opencode).

On first launch, Mason installs language servers including: bash-language-server, dockerfile-language-server, gopls, html/css, json-lsp, lua-lsp, pyright, ruby-lsp, rust-analyzer, sqlls, tailwindcss-language-server, typescript-language-server, and yaml-language-server.

### Opencode

AI coding assistant config in `opencode/`:

| Setting | Value |
|---------|-------|
| Theme | catppuccin-mocha |
| Model | opencode/big-pickle |
| Auto-update | enabled |

`opencode/opencode.json` and `opencode/themes/` are symlinked into `~/.config/opencode/`. See [opencode.ai](https://opencode.ai).

### Herdr

Agent multiplexer config in `herdr/`:

| Setting | Value |
|---------|-------|
| Theme | catppuccin-mocha |
| Shell | fish |
| Prefix | ctrl+b |
| Sidebar | agent state, workspace, tab |
| Notifications | system toast |

`herdr/config.toml` is symlinked into `~/.config/herdr/`. Herdr runs AI coding agents (Claude Code, OpenCode, etc.) in persistent panes with state tracking. The `claude` and `opencode` integrations are installed automatically by `install-herdr-integrations` during setup. They are what report agent state back to herdr; without them the sidebar state columns stay empty and `herdr agent wait --status idle` never resolves. The claude integration writes a hook to `~/.claude/hooks/` and registers a `SessionStart` entry in `~/.claude/settings.json`. Check with `herdr integration status`. See [herdr.dev](https://herdr.dev).

### Fonts

| Font | Description |
|------|-------------|
| `SethensSuperCode.ttf` | Custom Nerd Font-style font with icon glyphs (`U+F000-U+F1B2`) |

Installed to `~/.local/share/fonts/` (Omarchy/Ubuntu) or `~/Library/Fonts/` (macOS), and used by WezTerm, Starship, and Neovim for symbols.

## Symlink Map

Config lives in this repo and is symlinked into place, so edits here are live everywhere.

| Source | Destination | Platforms |
|--------|-------------|-----------|
| `config.fish` | `~/.config/fish/config.fish` | all |
| `fish/functions/` | `~/.config/fish/functions/` | all |
| `nvim/` | `~/.config/nvim/` | all |
| `starship/starship.toml` | `~/.config/starship.toml` | all |
| `wezterm/` | `~/.config/wezterm/` | all |
| `wezterm/desktop/org.wezfurlong.wezterm.desktop` | `~/.local/share/applications/org.wezfurlong.wezterm.desktop` | Omarchy |
| `wezterm/desktop/wezterm-open` | `~/.local/bin/wezterm-open` | Omarchy |
| `xdg/xdg-terminals.list` | `~/.config/xdg-terminals.list` | Omarchy |
| `yazi/` | `~/.config/yazi/` | all |
| `opencode/opencode.json` | `~/.config/opencode/opencode.json` | all |
| `opencode/themes/` | `~/.config/opencode/themes/` | all |
| `herdr/config.toml` | `~/.config/herdr/config.toml` | all |
| `mise/mise.toml` | `~/.config/mise/mise.toml` | all |
| `mise/.default-gems` | `~/.default-gems` | all |
| `.gitconfig` | `~/.gitconfig` | all |
| `.gitignore_global` | `~/.gitignore_global` | all |
| `hypr/monitors.lua` | `~/.config/hypr/monitors.lua` | Omarchy |
| `hypr/omarchy-launch-screensaver` | `~/.local/bin/omarchy-launch-screensaver` | Omarchy |
| `quickshell/shell.json` | `~/.config/omarchy/shell.json` | Omarchy |
| `quickshell/shell.toml` | `~/.config/omarchy/shell.toml` | Omarchy |
| `omarchy/bar/` | `~/.config/omarchy/bar/` | Omarchy |

## Desktop Environment (Omarchy/Hyprland)

On Omarchy, the base Wayland desktop is provided by [Omarchy](https://github.com/basecamp/omarchy); these dotfiles layer config on top:

- **Hyprland**: monitor layout in `hypr/monitors.lua`.
- **Omarchy shell**: bar layout and idle timings in `quickshell/shell.json`, theme overrides in `quickshell/shell.toml`, custom bar widgets in `quickshell/bar/modules/`.
- **Screensaver**: `hypr/omarchy-launch-screensaver`, a PATH shim covered below.

> Hyprland keybindings, window rules, and animations are managed by Omarchy itself, as are the stock bar widgets. This repo only owns the monitor config, the bar layout, the shell color overrides, and the per-app theming above.

### Omarchy 4 (quattro) notes

Omarchy 4 replaced the omarchy 3 desktop wholesale with a single long-running [Quickshell](https://quickshell.org/) process. Four things this repo used to own moved or disappeared:

| Omarchy 3 | Omarchy 4 |
| --- | --- |
| `waybar/config.jsonc`, `waybar/style.css` | `quickshell/shell.json` (layout), `quickshell/shell.toml` (colors) |
| `hypr/hypridle.conf` | `idle.screensaver` / `idle.lock` in `quickshell/shell.json` |
| `hypr/hyprlock.conf` | the `omarchy.lock` Quickshell plugin, which takes no config |
| `hypr/monitors.conf` | `hypr/monitors.lua` |

The `waybar`, `hyprlock`, and `hypridle` packages are no longer installed. The monitor change is the one that fails quietly: Hyprland 0.56 reads Lua (`hyprctl systeminfo` reports `configProvider: lua`), so a leftover `monitors.conf` is simply never loaded and the display silently falls back to its preferred mode.

**Bar font size.** Waybar ran 16px text. The shell derives every surface from one rem root (`[font] base-size` in `quickshell/shell.toml`), so raising it scales panels, notifications, and the menu too, and grows the bar past its stock 26px height. Set to 16 to match waybar; drop to 12 for omarchy's intended proportions.

### Icons

The bar uses omarchy's own icons, untouched. Its widgets draw them as literals in QML
and expose no icon setting, so changing one means cloning the widget into
`~/.config/omarchy/plugins/` and owning a copy of its source — which then stops tracking
upstream. That was tried and reverted: the maintenance is not worth it for a different
glyph, and a font carrying both icon sets shadowed the nerd font ranges neovim's devicons
use, changing every file icon in the editor.

`assets/fonts/SethensSuperCode.ttf` is [nonicons](https://github.com/ya2s/nonicons) (MIT,
© ya2s), covering `f000-f1b2`. `wezterm/lua/appearance.lua` puts it ahead of
`JetBrainsMono Nerd Font Mono` in the fallback chain, so it answers for that range and
nothing else — anything wider and it starts answering for glyphs the nerd font owns.

`quickshell/bar/modules/cpu.qml` is the one custom widget. Omarchy ships no cpu module, so
there is nothing to clone; it is ours outright and needs no patching.

### Screensaver on wezterm

Omarchy's screensaver only knows how to draw in Alacritty, Foot, Ghostty, or Kitty: it reads `xdg-terminal-exec --print-id` and refuses anything else. This repo points that at wezterm, so the stock launcher notifies and does nothing.

`hypr/omarchy-launch-screensaver` fixes it by shadowing the packaged command on `PATH` (`~/.local/bin` precedes `/usr/bin`) and delegating to the real one with `XDG_CONFIG_HOME` pointed at a temp directory whose `xdg-terminals.list` names Alacritty. Nothing else reads that variable, `~/.config/xdg-terminals.list` is untouched, and every upstream fix to the real launcher still applies.

Under omarchy 3 this file was called `launch-screensaver` because `hypridle.conf` invoked it by that name. Omarchy 4 runs the idle timer inside the shell, which calls `omarchy-launch-screensaver` by bare name, hence the rename.

## Custom Fish Functions

Functions live in `fish/functions/` (shared) and under each `os/<platform>` tree (install/symlink steps).

**Messaging** (`header-message`, `success-message`, `error-message`, `running-message`, `information-message`): consistent status output during setup.

**Git helpers** (`git-branch-name`, `git-sha`, `git-modified-files-count`, `git-staged-files-count`, `git-untracked-files-count`): available for use in a custom prompt or scripts.

**System** (`switch-shell-to-fish`, `reboot-system`, `confirm-reboot-system`, `create-directory-if-not-exists`, `delete-if-exists`, `make-symlink`).

**Setup helpers**:

- `authenticate-github`: runs `gh auth status` to check whether the GitHub CLI is already authenticated; if not, runs `gh auth login`.
- `set-gnome-preferences` (Ubuntu), the `clone-*` repo functions, and the `symlink-*` / `make-*` functions.

**AI agents** (`herdr-start`): starts the Herdr agent multiplexer, launches Claude and OpenCode if no agents are running, then attaches to the session.

**Package-manager wrappers** (in `os/<platform>/utilities/`): `brew-install-package`, `brew-cask-install-package`, `pacman-install-package`, `yay-install-package`, `sudo-apt-install-package`, `sudo-snap-install-package`, `flatpak-install-package`.

### Interactive launcher

`dot-launcher` (run via `fish run.fish --launcher`) uses `gum` to present a filterable list of every available function, so you can run individual steps instead of the full install.

## Environment Variables

Set in `config.fish`:

| Variable | Default | Description |
|----------|---------|-------------|
| `DEVELOPER_DIRECTORY` | `$HOME/Developer` | Working directory for projects |
| `BUN_INSTALL` | `$HOME/.bun` | Bun installation directory |

Set in `run.fish` during setup: `SYSTEM_OS`, `DOTFILES_DIRECTORY`, `DOTFILES_OS_DISTRO_DIRECTORY`, `DOTFILES_OS_COMMON_DIRECTORY`, `HOME_CONFIG_DIRECTORY`, `HOME_FISH_DIRECTORY`, plus `RUN_DOTFILES_REBOOT` / `RUN_DOTFILES_UPDATE` when the matching flags are passed.

## Advanced Usage

### Run individual phases

```bash
fish -c "source run.fish; run-darwin-pre"    # or run-omarchy-pre / run-ubuntu-pre
fish -c "source run.fish; run-darwin-main"   # or run-omarchy-main / run-ubuntu-main
fish -c "source run.fish; run-common-post"
```

### Run a specific function

```bash
fish run.fish --launcher                     # pick from the menu
fish -c "source run.fish; install-wezterm"   # or call directly
```

### Update or reboot

```bash
fish run.fish --update    # update pass
fish run.fish --reboot    # reboot when done
```

## Customization

### Add a mise tool

Edit `mise/mise.toml`:

```toml
[tools]
your-tool = "latest"  # or a specific version
```

Then run `mise install`.

### Add a Neovim plugin

Add a file (or entry) under `nvim/lua/sethen/plugins/`:

```lua
return {
  "owner/repo",
  event = "VeryLazy",
  config = function()
    -- your config
  end,
}
```

### Add a platform package

- **Omarchy:** add an `install-*` function and call it in `os/omarchy/main/run-omarchy-main.fish`.
- **Ubuntu:** add it to `os/ubuntu/main/run-ubuntu-main.fish` (apt, snap, or flatpak).
- **macOS:** add it to `os/darwin/main/run-darwin-main.fish`.

## Project Structure

```
dotfiles/
├── run.fish                    # Main entry point
├── config.fish                 # Fish shell configuration
├── .gitconfig                  # Git configuration
├── .gitignore_global           # Global gitignore
├── AGENTS.md                   # Agent coding guidelines
├── fish/
│   └── functions/              # Shared Fish functions
├── os/
│   ├── common/                 # Cross-platform steps
│   │   ├── pre/ main/ post/    # Phase scripts
│   │   └── utilities/          # Shared helpers (dot-launcher)
│   ├── darwin/                 # macOS (pre, main, utilities)
│   ├── omarchy/                # Arch/Hyprland (pre, main, utilities)
│   └── ubuntu/                 # Ubuntu (pre, main, utilities)
├── mise/
│   ├── mise.toml               # Tool versions (source of truth)
│   └── .default-gems           # Default Ruby gems
├── nvim/
│   └── lua/sethen/
│       ├── core/               # Options, keymaps, LSP, autocmds
│       ├── plugins/            # Plugin configs
│       └── lazy.lua            # lazy.nvim bootstrap
├── opencode/
│   ├── opencode.json           # Opencode config
│   └── themes/                 # Opencode themes
├── herdr/
│   └── config.toml             # Herdr agent multiplexer config
├── starship/
│   └── starship.toml           # Prompt configuration
├── wezterm/
│   ├── wezterm.lua             # Terminal entry point
│   ├── lua/                    # theme, appearance, mux, status, keys, workspaces
│   └── desktop/                # desktop entry + wezterm-open wrapper
├── xdg/
│   └── xdg-terminals.list      # xdg-terminal-exec preference order
├── yazi/
│   ├── yazi.toml               # Manager settings
│   ├── theme.toml              # Flavor selection + icon table
│   └── flavors/                # Installed flavor package(s)
├── hypr/
│   ├── monitors.lua            # Monitor configuration (Omarchy)
│   └── omarchy-launch-screensaver  # PATH shim: screensaver under wezterm
├── quickshell/
│   ├── shell.json              # Bar layout + idle timings (Omarchy)
│   ├── shell.toml              # Shell color overrides (Omarchy)
│   └── bar/modules/            # cpu.qml, the one custom bar widget (Omarchy)
└── assets/
    ├── fonts/                  # SethensSuperCode.ttf
    ├── images/                 # Screenshots
    └── videos/                 # Demos
```

## Troubleshooting

**Symlink already exists.** Steps are idempotent and overwrite their own symlinks. To force a clean target, delete it first.

**`mise` not found after install.** Open a new shell so `config.fish` runs, or confirm `~/.local/bin` is on `PATH`. `config.fish` only activates mise when it is present.

**Neovim plugins not loading.** Run `:Lazy sync`.

**Language servers not starting.** Check Mason with `:Mason`, and ensure the servers installed on first launch.

### Verification commands

```bash
fish -n run.fish                                   # syntax-check the installer
nvim --headless -c "lua require('sethen')" -c "qa" # Neovim loads cleanly
mise doctor                                         # mise health
mise ls                                             # installed tools
starship config validate                            # prompt config
```

---

**Made with care by [Sethen](https://github.com/sethen)**
