# Sethen's Dotfiles

> One Fish-powered installer that bootstraps a complete development environment on macOS, CachyOS (Arch/Hyprland), and Ubuntu.

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
- [Desktop Environment (CachyOS/Hyprland)](#desktop-environment-cachyoshyprland)
- [Custom Fish Functions](#custom-fish-functions)
- [Environment Variables](#environment-variables)
- [Advanced Usage](#advanced-usage)
- [Customization](#customization)
- [Project Structure](#project-structure)
- [Troubleshooting](#troubleshooting)

## Highlights

- **One installer, three operating systems.** A single `fish run.fish` detects macOS, CachyOS (Arch/Hyprland), or Ubuntu and runs the matching scripts. Shared steps live in `os/common`; platform-specific steps live under `os/darwin`, `os/cachyos`, and `os/ubuntu`.
- **Phase-based and idempotent.** Setup runs in `pre`, `main`, and `post` phases. Re-running is safe: symlinks use `ln -sfv`, and installers check before reinstalling.
- **One toolchain manager.** Almost every CLI tool and language runtime is pinned in `mise/mise.toml` and installed by [mise](https://mise.jdx.dev), so the same versions land on every machine.
- **Catppuccin Mocha everywhere.** Kitty, Starship, Neovim, Yazi, and Opencode all share the same palette.
- **A custom Nerd Font.** `SethensSuperCode.ttf` carries the icon glyphs used across the terminal, prompt, and editor.
- **Interactive or hands-off.** Run the whole thing automatically, or use `--launcher` to pick individual steps from a filterable menu.

## Supported Platforms

| Platform | Base requirement |
|----------|------------------|
| **macOS (Darwin)** | A working macOS install. Homebrew is installed for you if missing. |
| **CachyOS (Hyprland)** | A CachyOS install with the Hyprland desktop (Noctalia shell). |
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
| `-u`, `--update` | Run an update pass: the system package manager plus `mise upgrade`. That means `brew update && brew upgrade` on macOS and `apt-get update && apt-get upgrade` on Ubuntu, and `yay -Syu --noconfirm` on CachyOS, all followed by `mise upgrade`. Without it, tools are only installed when missing, never bumped. |
| `-r`, `--reboot` | Reboot after setup completes. |

## How It Works

### Entry point: `run.fish`

`run.fish` is the single entry point. It:

1. **Detects the OS** and sets `SYSTEM_OS` to `darwin`, `cachyos`, or `ubuntu`. macOS and Ubuntu come from `uname`; CachyOS is recognized by `ID=cachyos` in `/etc/os-release`.
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
│   ├── mise self-update → only a self-managed mise
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

`mise self-update` runs before anything installs through mise, but only when mise lives under `$HOME`. This is not cosmetic: mise's tool registry is compiled into the mise binary, so a mise older than a tool's registry entry cannot resolve that tool by name and `mise install` fails identically on every run. A mise from a system package manager is built with self-update compiled out and only prints errors when asked, so those installs move with the platform upgrade instead. `verify-mise-tools` runs after the install pass and reports anything in `mise.toml` that never landed, since `mise install` exits 0 even when a tool is missing.

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
| herdr | Agent session manager (installed via mise on every platform) |

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

**CachyOS (pacman / yay)**

> The MySQL client is `mariadb-clients` rather than a mise tool. mise installs MySQL's official glibc2.28 tarball, which links against `libncurses.so.6`; Arch ships only the wide-char `libncursesw.so.6`, so that binary cannot start at all. Ubuntu gets `mariadb-client` for the same reason of consistency, even though the tarball does work there.

brave, vlc, virtualbox, postgresql, mariadb-clients, nginx, ffmpeg, gparted, gpick, font-manager, mdadm, openssh, fortune-mod, spotify-launcher, discord, ttf-jetbrains-mono

> `virtualbox` is queued with `virtualbox-host-dkms`, because the `linux-cachyos` kernel needs DKMS-built modules. `run-cachyos-pre` also installs `yay` from the CachyOS repo, plus `docker` and `docker-buildx`.

> CachyOS packages install in one transaction per stage, not one per package. Each `install-*` function calls `yay-queue-package`, which skips anything already installed (`pacman -Q`, exact name) and adds the rest to `DOTFILES_YAY_QUEUE`. `yay-install-queued-packages` then installs the whole queue with a single `yay -S`, once at the end of `run-cachyos-pre` and once at the end of `run-cachyos-main`. The reason is snapper: CachyOS takes a pre and post snapshot for every pacman transaction and waits on `limine-snapper-sync` each time, so installing package by package produced about 36 snapshots per run and buried the useful rollback points in the boot menu. The tradeoff is all or nothing: one package that fails to resolve aborts the transaction, and nothing in that stage installs until it is fixed. New CachyOS packages should use `yay-queue-package`; `pacman-install-package` is kept only for bootstrapping `yay` itself.

> Kitty is a system package rather than a mise tool on purpose: it is a GUI application with an OpenGL renderer and a desktop entry, none of which mise's backends install. A real package also supplies the terminfo and the icon.
>
> On CachyOS it is not installed here at all: CachyOS ships kitty preinstalled as its default terminal. On macOS it comes from Homebrew. On Ubuntu it comes from upstream's installer into `~/.local/kitty.app` instead of apt, because the apt build lags behind the `goto_session` and `active_session_name` support the session config here depends on.

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
- `kitty/os/linux.conf`, `kitty/os/darwin.conf`: the per-platform handful. `symlink-kitty-config-files` links one of them to `~/.config/kitty/os-local.conf` based on `$SYSTEM_OS`, because Kitty has no conditional include. macOS has no `XDG_RUNTIME_DIR`, which is why the control socket path is not in the shared file. On Linux the socket is `${XDG_RUNTIME_DIR}/kitty-{kitty_pid}`.
- `kitty/tab_bar.py`: `tab_bar_style custom`. Bar at the bottom, tabs centered, session name pinned right. The centering is done here rather than with `tab_bar_align center`: Kitty centers in `align_with_factor()`, which runs after every tab is drawn and shifts the line with `insert_characters()`, which would carry a right-pinned badge off the edge.
- `kitty/sessions/*.kitty-session`: one per project. `dotfiles` gets `nvim`, `lazydocker`, an `opencode` agent with `lazygit` split in beside it, and a shell; `gem` adds a `stack` tab that brings the compose stack up and tails it; `main` holds what belongs to no project (`shell`, `herdr`, `yazi`, `btop`). Sessions deliberately do *not* open their own OS window; they share one, and `tab_bar_filter` (see above) hides the tabs of whichever session is not active, so switching swaps the tab bar in place. Paths use `$DEVELOPER_DIRECTORY`, which session files expand, so they work unchanged on any machine. Each command runs through a login `fish` so mise is on `PATH`, and uses `exec` so the program becomes the window's own process and names the tab; the two that must not (a fish function, and the multi-statement `stack` command) deliberately skip it. The agents are plain panes rather than herdr agents, so each is rooted in its own codebase; herdr is one global session with one shared agent list and no project in it, which is also why `herdr` is only in `main`. `kitty-restart` kills kitty so the sessions rebuild.
- `kitty/tab-search.sh`: `CTRL+SHIFT+SPACE`. Kitty's own `select_tab` renders a numbered list through the hints kitten rather than a filter, so this pipes `kitty @ ls` through fzf and focuses the result. Searches every session, not just the current window.

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

Installed to `~/.local/share/fonts/` (CachyOS/Ubuntu) or `~/Library/Fonts/` (macOS), and used by Kitty, Starship, and Neovim for symbols. The font is [nonicons](https://github.com/ya2s/nonicons) (MIT, (c) ya2s); `kitty/kitty.conf` maps `f000-f1b2` to it with `JetBrainsMono Nerd Font Mono` in the fallback chain, so it answers for that range and nothing else.

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
| `yazi/` | `~/.config/yazi/` | all |
| `opencode/opencode.json` | `~/.config/opencode/opencode.json` | all |
| `opencode/themes/` | `~/.config/opencode/themes/` | all |
| `herdr/config.toml` | `~/.config/herdr/config.toml` | all |
| `mise/mise.toml` | `~/.config/mise/mise.toml` | all |
| `mise/.default-gems` | `~/.default-gems` | all |
| `.gitconfig` | `~/.gitconfig` | all |
| `.gitignore_global` | `~/.gitignore_global` | all |
| `hypr/monitors.lua` | `~/.config/hypr/config/monitors.lua` | CachyOS |
| `hypr/decorations.lua` | `~/.config/hypr/config/decorations.lua` | CachyOS |
| `hypr/variables.lua` | `~/.config/hypr/config/variables.lua` | CachyOS |
| `hypr/workspaces.lua` | `~/.config/hypr/config/workspaces.lua` | CachyOS |
| `hypr/keybinds.lua` | `~/.config/hypr/config/keybinds.lua` | CachyOS |
| `hypr/hyprland.lua` | `~/.config/hypr/hyprland.lua` | CachyOS |
| `noctalia/config.toml` | `~/.config/noctalia/config.toml` | CachyOS |
| `noctalia/greeter.toml` | `/var/lib/noctalia-greeter/greeter.toml` (copied, not linked) | CachyOS |
| `avatars/$USER.jpg` | `/var/lib/AccountsService/icons/$USER` (via AccountsService) | CachyOS |

## Desktop Environment (CachyOS/Hyprland)

On CachyOS, the base Wayland desktop is Hyprland with the [Noctalia](https://github.com/noctalia-dev/noctalia) shell, as shipped by CachyOS. Keybindings and window rules come from CachyOS itself (`~/.config/hypr/config/*.lua`). This repo owns the monitor layout, in `hypr/monitors.lua`, window decorations, in `hypr/decorations.lua` (CachyOS's stock file with square corners, wider gaps between windows, and Omarchy's Catppuccin border colors), the monitor names and per-monitor workspaces, in `hypr/variables.lua` and `hypr/workspaces.lua` (workspaces 1–5 on `HDMI-A-1`, 6–10 on `DP-2`), your own keybinds, in `hypr/keybinds.lua` (loaded last by `hypr/hyprland.lua`, CachyOS's stock file plus one `require`, so CachyOS's `binds.lua` stays stock and these add to it), and the Noctalia config, in `noctalia/config.toml`. It replaces the `config.toml` CachyOS installs; the stock copy stays in `/etc/skel/.config/noctalia/config.toml`.

**Login screen.** CachyOS logs in through greetd and [noctalia-greeter](https://github.com/noctalia-dev/noctalia-greeter). `noctalia/greeter.toml` sets it to a wallpaper, the Catppuccin palette, JetBrains Mono, and the password box, with the logo, power buttons and scheme picker hidden. The greeter runs as its own user and cannot read the home directory, so `copy-noctalia-greeter-config` and `copy-noctalia-greeter-wallpaper` copy the file and the wallpaper into `/var/lib/noctalia-greeter/` with `sudo` rather than linking them; rerun `copy-noctalia-greeter-config` after editing `greeter.toml`. **If you are not me, edit `greeter.toml` first:** `[user] default` is my username and `[output] name` is my monitor.

**Avatar.** `set-user-avatar` sets the login avatar from `avatars/$USER.jpg` through AccountsService. The only image in the repo is `avatars/sethen.jpg`, which is my face; a different username skips the step and keeps its current avatar. To use your own, add a square image named after your username (`avatars/<username>.jpg`). Greeter 1.5.0 renders avatars slightly soft on scaled monitors; 1.6.0 fixes it.

**Keyring.** greetd's PAM file, unlike SDDM's or GDM's, does not pass the login password to gnome-keyring, so the keyring asks for a password on every login. `enable-greetd-keyring-unlock` adds `pam_gnome_keyring.so` to `/etc/pam.d/greetd` (as `optional`, so it cannot block login), which unlocks the keyring named `login` when you sign in. A keyring an app created before this ran (usually `Default_keyring`) is not unlocked; give it your login password and rename it to `login`, or delete it and let the next login create one.

`run-cachyos-pre` symlinks it to `~/.config/hypr/config/monitors.lua`, replacing CachyOS's stock catch-all monitor rule. CachyOS's `hyprland.lua` requires `config.monitors`, so the file has to live at that path. Hyprland reads Lua, so a legacy `monitors.conf` is never loaded.

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
fish -c "source run.fish; run-darwin-pre"    # or run-cachyos-pre / run-ubuntu-pre
fish -c "source run.fish; run-darwin-main"   # or run-cachyos-main / run-ubuntu-main
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

- **CachyOS:** add an `install-*` function that calls `yay-queue-package`, and call it in `os/cachyos/main/run-cachyos-main.fish` before `yay-install-queued-packages`.
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
│   ├── cachyos/                # Arch/Hyprland (pre, main, utilities)
│   └── ubuntu/                 # Ubuntu (pre, main, utilities)
├── mise/
│   ├── mise.toml               # Tool versions (source of truth)
│   └── .default-gems           # Default Ruby gems
├── nvim/
│   └── lua/sethen/
│       ├── core/               # Options, keymaps, LSP, autocmds
│       ├── plugins/            # Plugin configs
│       └── lazy.lua            # lazy.nvim bootstrap
├── noctalia/
│   └── config.toml             # Noctalia shell config (CachyOS)
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
├── yazi/
│   ├── yazi.toml               # Manager settings
│   ├── theme.toml              # Flavor selection + icon table
│   └── flavors/                # Installed flavor package(s)
├── hypr/
│   ├── hyprland.lua            # CachyOS's entry file plus require("config.keybinds")
│   ├── keybinds.lua            # Your keybinds, on top of CachyOS's binds.lua
│   ├── decorations.lua         # Window borders, rounding, gaps, blur (CachyOS)
│   ├── monitors.lua            # Monitor configuration (CachyOS)
│   ├── variables.lua           # Default apps and monitor names (CachyOS)
│   └── workspaces.lua          # Workspaces 1-5 and 6-10 pinned per monitor (CachyOS)
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
