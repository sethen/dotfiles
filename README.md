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
- **Catppuccin Mocha everywhere.** Kitty, Starship, Neovim, Yazi, and Opencode all share the same palette.
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
| `-u`, `--update` | Run an update pass: the system package manager plus `mise upgrade`. That means `brew update && brew upgrade` on macOS and `apt-get update && apt-get upgrade` on Ubuntu, both followed by `mise upgrade`; on Omarchy it is `omarchy update` alone, which upgrades mise tools itself. Without it, tools are only installed when missing, never bumped. |
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
│   ├── mise self-update → only a self-managed mise; a packaged one moves with the OS
│   ├── mise install   → installs all tools from mise/mise.toml
│   ├── mise upgrade   → only with --update; bumps `latest` specs to newest
│   ├── verify-mise-tools → fails loudly if a requested tool never installed
│   ├── Install herdr agent integrations (claude, opencode)
│   └── Authenticate with GitHub (ssh key check, else `gh auth login`)
├── Main Phase (os/common/main, os/<platform>/main)
│   ├── Install OS packages (brew / pacman / apt / snap / flatpak)
│   ├── Install language servers (via bun)
│   └── Clone repositories (dotfiles, wallpapers)
│   └── Symlink wallpapers into every Omarchy theme (omarchy only)
└── Post Phase (os/common/post)
    └── Final configuration
```

Why this shape? The phase split keeps ordering correct (mise exists before `mise install`, configs are symlinked before tools read them), and the `common` vs per-platform split means a tool only needs documenting once while platform quirks stay isolated.

## What Gets Installed

### Development tools (via mise)

`mise/mise.toml` is the source of truth for tool versions. `mise install` reads it and installs everything below.

> Omarchy takes `omarchy update` rather than a bare `yay`. Omarchy 4 ships a pacman `PreTransaction` hook, `omarchy-update-pacman-guard`, that aborts any transaction carrying both `-S` and `-u`, so a direct full upgrade fails with `failed to run transaction hooks` and upgrades nothing. Single-package installs are untouched, which is why `yay-install-package` still works. `omarchy update` is also a superset: cache prune, snapshot, keyring refresh, repo upgrade, migrations, then `omarchy-update-aur-pkgs`.

> On Omarchy the shared `mise upgrade` is skipped, because `omarchy update` ends with `MISE_MINIMUM_RELEASE_AGE=0 mise up` against this same `mise.toml` and runs first. Worth knowing what that costs: mise's 24-hour release cooldown is effectively gone there, since the pass that bypasses it happens before the pass that respects it. That is what makes a publisher who tags a version before uploading its binaries, as HashiCorp did with terraform 1.16.0, fail the whole update.

Note that `mise install` is not an upgrade: a tool that is already installed satisfies a `latest` spec indefinitely, so re-running setup will never move it forward. Pass `-u` / `--update` (or run `mise upgrade` yourself) to bump versions. `mise outdated` shows what is behind.

`mise self-update` runs before anything installs through mise, but only when mise lives under `$HOME`. This is not cosmetic: mise's tool registry is compiled into the mise binary, so a mise older than a tool's registry entry cannot resolve that tool by name and `mise install` fails identically on every run. A mise from a system package manager (`omarchy/mise-bin` here) is built with self-update compiled out and only prints errors when asked, so those installs move with the platform upgrade instead. `verify-mise-tools` runs after the install pass and reports anything in `mise.toml` that never landed, since `mise install` exits 0 even when a tool is missing.

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
| herdr | Agent session manager (Omarchy ships it too; mise covers macOS and Ubuntu) |

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
| fortune, git, gnupg, nginx | brave-browser, kitty, font-jetbrains-mono, spotify, virtualbox |

**Omarchy (pacman / yay)**

> The MySQL client is `mariadb-clients` rather than a mise tool. mise installs MySQL's official glibc2.28 tarball, which links against `libncurses.so.6`; Arch ships only the wide-char `libncursesw.so.6`, so that binary cannot start at all. Ubuntu gets `mariadb-client` for the same reason of consistency, even though the tarball does work there.

brave, vlc, virtualbox, postgresql, mariadb-clients, nginx, ffmpeg, gparted, gpick, font-manager, grub, mdadm, openssh, ca-certificates, curl, fortune-mod, spotify-launcher, discord, kitty, ttf-jetbrains-mono

> Kitty is a system package rather than a mise tool on purpose: it is a GUI application with an OpenGL renderer and a desktop entry, none of which mise's backends install. A real package also supplies the terminfo and the icon.
>
> On Omarchy and macOS it comes from the platform package manager. On Ubuntu it comes from upstream's installer into `~/.local/kitty.app` instead of apt, because the apt build lags behind the `goto_session` and `active_session_name` support the session config here depends on.

**Ubuntu (apt / snap / flatpak)**

| Source | Packages |
|--------|----------|
| apt | brave-browser, vlc, virtualbox, postgresql, nginx, gparted, gpick, font-manager, fonts-jetbrains-mono, autoconf, bison, build-essential, ca-certificates, gnupg, gnome-tweaks, lsb-release, mdadm, ncurses, fortune-mod |
| snap | discord, spotify |
| flatpak | zen-browser, flatpak |
| custom | kitty (upstream installer), White Sur icon theme (git) |

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

### Kitty terminal

The primary terminal. Kitty draws the windows and multiplexes panes, tabs and named sessions. It has no server behind the GUI, so sessions do not outlive the kitty process; run tmux inside a tab if you need that.

Keybindings are Kitty's defaults. Everything this repo adds sits on `CTRL+SHIFT+ALT+*`, so no default is shadowed except `shift+insert`, which is deliberately the clipboard rather than the selection. `CTRL+SHIFT+SPACE` searches tabs by name, `CTRL+SHIFT+ALT+O` lists the sessions, `CTRL+SHIFT+ALT+1..4` jump to one directly. Run `kitty +list-keybinds` for the rest.

Almost all of it is shared across every OS. Only `listen_on` and the window-decoration handling differ, and those live in one small per-platform file.

- `kitty/kitty.conf`: fonts, the pinned Catppuccin Mocha palette, chrome and keys. Ends with `include os-local.conf`.
- `kitty/os/linux.conf`, `kitty/os/darwin.conf`: the per-platform handful. `symlink-kitty-config-files` links one of them to `~/.config/kitty/os-local.conf` based on `$SYSTEM_OS`, because Kitty has no conditional include. macOS has no `XDG_RUNTIME_DIR`, which is why the control socket path is not in the shared file.
- `kitty/tab_bar.py`: `tab_bar_style custom`. Bar at the bottom, tabs centered, session name pinned right. The centering is done here rather than with `tab_bar_align center`: Kitty centers in `align_with_factor()`, which runs after every tab is drawn and shifts the line with `insert_characters()`, which would carry a right-pinned badge off the edge.
- `kitty/sessions/*.kitty-session`: one per project. `dotfiles` gets `nvim`, `lazydocker`, an `opencode` agent with `lazygit` split in beside it, and a shell; `gem` adds a `stack` tab that brings the compose stack up and tails it; `main` holds what belongs to no project (`shell`, `herdr`, `yazi`, `btop`). Sessions deliberately do *not* open their own OS window; they share one, and `tab_bar_filter` (see above) hides the tabs of whichever session is not active, so switching swaps the tab bar in place. Paths use `$DEVELOPER_DIRECTORY`, which session files expand, so they work unchanged on any machine. Each command runs through a login `fish` so mise is on `PATH`, and uses `exec` so the program becomes the window's own process and names the tab; the two that must not (a fish function, and the multi-statement `stack` command) deliberately skip it. The agents are plain panes rather than herdr agents, so each is rooted in its own codebase; herdr is one global session with one shared agent list and no project in it, which is also why `herdr` is only in `main`. `kitty-restart` kills kitty so the sessions rebuild.
- `kitty/tab-search.sh`: `CTRL+SHIFT+SPACE`. Kitty's own `select_tab` renders a numbered list through the hints kitten rather than a filter, so this pipes `kitty @ ls` through fzf and focuses the result. Searches every session, not just the current window.
- `xdg/xdg-terminals.list`: names Kitty as the terminal `xdg-terminal-exec` should pick, which is what Omarchy's `SUPER+RETURN` and its launcher call. Without it the choice among installed `TerminalEmulator` entries is unspecified. It sits outside `kitty/` because it is a system-level choice of terminal rather than Kitty configuration.

### Yazi file manager

Config in `yazi/`:

- `yazi.toml`: manager settings (permission line mode, show hidden, show symlinks)
- `theme.toml`: selects the `catppuccin-mocha` flavor and defines a large icon table (per-extension glyphs and colors)
- `flavors/catppuccin-mocha.yazi/`: the installed flavor package: `flavor.toml` (UI colors) and `tmtheme.xml` (syntax highlighting for the preview pane)

### Neovim

A full Lua configuration under `nvim/lua/sethen/` using `lazy.nvim`:

- **Core** (`core/`): options, keymaps, LSP setup, autocommands, constants.
- **Plugins** (`plugins/`): one file per plugin area.

Highlights: catppuccin theme, lualine, nvim-tree, telescope (+ fzf-native), treesitter (pinned to `master`; `main` is an incompatible rewrite), blink-cmp completion, mason, gitsigns, oil, which-key, and todo-comments. The agents run as their own kitty tabs rather than as nvim plugins, so there is no copilot or opencode integration in here.

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

Installed to `~/.local/share/fonts/` (Omarchy/Ubuntu) or `~/Library/Fonts/` (macOS), and used by Kitty, Starship, and Neovim for symbols.

## Symlink Map

Config lives in this repo and is symlinked into place, so edits here are live everywhere.

| Source | Destination | Platforms |
|--------|-------------|-----------|
| `config.fish` | `~/.config/fish/config.fish` | all |
| `fish/functions/` | `~/.config/fish/functions/` | all |
| `nvim/` | `~/.config/nvim/` | all |
| `starship/starship.toml` | `~/.config/starship.toml` | all |
| `kitty/kitty.conf` | `~/.config/kitty/kitty.conf` | all |
| `kitty/tab_bar.py` | `~/.config/kitty/tab_bar.py` | all |
| `kitty/tab-search.sh` | `~/.config/kitty/tab-search.sh` | all |
| `kitty/sessions/` | `~/.config/kitty/sessions/` | all |
| `kitty/os/{linux,darwin}.conf` | `~/.config/kitty/os-local.conf` | all |
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
| `quickshell/bar/` | `~/.config/omarchy/bar/` | Omarchy |

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
© ya2s), covering `f000-f1b2`. `kitty/kitty.conf` maps that range to it with
`JetBrainsMono Nerd Font Mono` in the fallback chain, so it answers for that range and
nothing else — anything wider and it starts answering for glyphs the nerd font owns.

`quickshell/bar/modules/cpu.qml` is the one custom widget. Omarchy ships no cpu module, so
there is nothing to clone; it is ours outright and needs no patching.

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
fish -c "source run.fish; install-kitty"     # or call directly
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
├── kitty/
│   ├── kitty.conf              # Shared terminal config
│   ├── os/                     # linux.conf, darwin.conf (one is os-local.conf)
│   ├── tab_bar.py              # Custom status bar
│   ├── tab-search.sh           # fzf tab picker
│   ├── sessions/               # main, dotfiles, gem (work sessions are gitignored)
│   └── local/                  # gitignored: machine-local overrides
├── xdg/
│   └── xdg-terminals.list      # xdg-terminal-exec preference order
├── yazi/
│   ├── yazi.toml               # Manager settings
│   ├── theme.toml              # Flavor selection + icon table
│   └── flavors/                # Installed flavor package(s)
├── hypr/
│   ├── monitors.lua            # Monitor configuration (Omarchy)
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
