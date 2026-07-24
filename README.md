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
- **Catppuccin Mocha everywhere.** Ghostty, Starship, Neovim, Zellij, Yazi, and Opencode all share the same palette.
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
| `-u`, `--update` | Run an update pass (e.g. `brew update && brew upgrade` on macOS). |
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
│   ├── mise install   → installs all tools from mise/mise.toml
│   ├── Install sesh (go)
│   └── Authenticate with GitHub (ssh key check, else `gh auth login`)
├── Main Phase (os/common/main, os/<platform>/main)
│   ├── Install OS packages (brew / pacman / apt / snap / flatpak)
│   ├── Install language servers (via bun)
│   └── Clone repositories (dotfiles, wallpapers, tmux plugin manager)
└── Post Phase (os/common/post)
    └── Final configuration
```

Why this shape? The phase split keeps ordering correct (mise exists before `mise install`, configs are symlinked before tools read them), and the `common` vs per-platform split means a tool only needs documenting once while platform quirks stay isolated.

## What Gets Installed

### Development tools (via mise)

`mise/mise.toml` is the source of truth for tool versions. `mise install` reads it and installs everything below.

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
| gum | Pretty interactive shell scripts |
| zoxide | Smart directory jumper |
| starship | Shell prompt |
| tmux | Terminal multiplexer |
| zellij | Terminal workspace |
| yazi | Terminal file manager |
| neovim | Modern Vim editor |
| gh | GitHub CLI |
| mysql | MySQL client |

**Terminal UIs & AI**

| Tool | Description |
|------|-------------|
| lazygit | TUI for Git |
| lazydocker | TUI for Docker |
| lazyssh | SSH manager |
| crush | AI coding agent |
| opencode | AI coding assistant |
| claude-code | Anthropic's official CLI for Claude |

### Language servers (via bun)

Installed during the main phase for editor LSP support: `bash-language-server`, `fish-lsp`, `typescript` + `typescript-language-server`, `vscode-langservers-extracted`, and `yaml-language-server`.

### Platform packages

Cross-platform apps appear in more than one table on purpose: each OS installs them through its native package manager.

**macOS (Homebrew)**

| CLI (`brew`) | GUI (`brew --cask`) |
|--------------|---------------------|
| git, gnupg, nginx | brave-browser, ghostty, spotify, virtualbox |

**Omarchy (pacman / yay)**

brave, vlc, virtualbox, postgresql, nginx, ffmpeg, gparted, gpick, font-manager, grub, mdadm, openssh, ca-certificates, curl, fortune-mod

**Ubuntu (apt / snap / flatpak)**

| Source | Packages |
|--------|----------|
| apt | brave-browser, vlc, virtualbox, postgresql, nginx, gparted, gpick, font-manager, autoconf, bison, build-essential, ca-certificates, gnupg, gnome-tweaks, lsb-release, mdadm, ncurses, fortune-mod |
| snap | discord, spotify |
| flatpak | zen-browser, flatpak |
| custom | ghostty (`.deb`), White Sur icon theme (git) |

> The GitHub CLI (`gh`) is installed through mise, not a system package manager, so it is the same version on every platform.

## Configuration Tour

### Fish shell

`config.fish` sets up the interactive shell:

- Exports `DEVELOPER_DIRECTORY` and `BUN_INSTALL`, and puts `~/.bun/bin`, `~/.local/bin`, and Homebrew on `PATH`.
- Activates mise when present (`if type -q mise`).
- For interactive sessions, initializes `zoxide` and `starship` (each guarded by `type -q`).
- Greeting comes from `fortune`.

### Starship prompt

Minimal, fast prompt using the Catppuccin Mocha palette. Shows user, directory, language versions (c, dotnet, golang, nodejs, python, ruby, rust), and git branch/status.

### Ghostty terminal

`ghostty/config` is a single file:

- `theme = Catppuccin Mocha` (Ghostty's built-in theme)
- 13pt font with `adjust-cell-height = 3`
- `async-backend = epoll`
- `font-codepoint-map` routes the icon range `U+F000-U+F1B2` to `SethensSuperCode`

### Yazi file manager

Config in `yazi/`:

- `yazi.toml`: manager settings (permission line mode, show hidden, show symlinks)
- `theme.toml`: selects the `catppuccin-mocha` flavor and defines a large icon table (per-extension glyphs and colors)
- `flavors/catppuccin-mocha.yazi/`: the installed flavor package: `flavor.toml` (UI colors) and `tmtheme.xml` (syntax highlighting for the preview pane)

### Zellij workspace

- `zellij/config.kdl`: default mode `locked`, `zjstatus` status bar plugin, Catppuccin Mocha theme.
- `zellij/layouts/default.kdl`: custom status bar with per-mode indicators, opening two tabs: `nvim` and `opencode`.

### tmux

`tmux/tmux.conf`, with plugins managed by TPM (cloned during the main phase).

### sesh

`sesh/sesh.toml` configures the [sesh](https://github.com/joshmedeski/sesh) tmux session manager.

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

`herdr/config.toml` is symlinked into `~/.config/herdr/`. Herdr runs AI coding agents (Claude Code, OpenCode, etc.) in persistent panes with state tracking. Install integrations with `herdr integration install claude` and `herdr integration install opencode`. See [herdr.dev](https://herdr.dev).

### Fonts

| Font | Description |
|------|-------------|
| `SethensSuperCode.ttf` | Custom Nerd Font-style font with icon glyphs (`U+F000-U+F1B2`) |

Installed to `~/.local/share/fonts/` (Omarchy/Ubuntu) or `~/Library/Fonts/` (macOS), and used by Ghostty, Starship, and Neovim for symbols.

## Symlink Map

Config lives in this repo and is symlinked into place, so edits here are live everywhere.

| Source | Destination | Platforms |
|--------|-------------|-----------|
| `config.fish` | `~/.config/fish/config.fish` | all |
| `fish/functions/` | `~/.config/fish/functions/` | all |
| `nvim/` | `~/.config/nvim/` | all |
| `starship/starship.toml` | `~/.config/starship.toml` | all |
| `ghostty/` | `~/.config/ghostty/` | all |
| `yazi/` | `~/.config/yazi/` | all |
| `zellij/config.kdl` | `~/.config/zellij/config.kdl` | all |
| `zellij/layouts/` | `~/.config/zellij/layouts/` | all |
| `tmux/tmux.conf` | `~/.config/tmux/tmux.conf` | all |
| `sesh/` | `~/.config/sesh/` | all |
| `opencode/opencode.json` | `~/.config/opencode/opencode.json` | all |
| `opencode/themes/` | `~/.config/opencode/themes/` | all |
| `herdr/config.toml` | `~/.config/herdr/config.toml` | all |
| `mise/mise.toml` | `~/.config/mise/mise.toml` | all |
| `mise/.default-gems` | `~/.default-gems` | all |
| `.gitconfig` | `~/.gitconfig` | all |
| `.gitignore_global` | `~/.gitignore_global` | all |
| `hypr/monitors.conf` | `~/.config/hypr/monitors.conf` | Omarchy |
| `hypr/hyprlock.conf` | `~/.config/hypr/hyprlock.conf` | Omarchy |
| `waybar/` | `~/.config/waybar/` | Omarchy |

## Desktop Environment (Omarchy/Hyprland)

On Omarchy, the base Wayland desktop is provided by [Omarchy](https://github.com/basecamp/omarchy); these dotfiles layer config on top:

- **Hyprland**: monitor layout in `hypr/monitors.conf`; lock screen font in `hypr/hyprlock.conf`.
- **Waybar**: status bar (`waybar/config.jsonc`, `waybar/style.css`).
- **Mako**, **Walker**, **Ghostty**: notifications, launcher, and terminal.

> Hyprland keybindings, window rules, animations, and the broader Waybar setup are managed by Omarchy itself. This repo only owns the monitor config, the hyprlock font override, and the per-app theming above.

## Custom Fish Functions

Functions live in `fish/functions/` (shared) and under each `os/<platform>` tree (install/symlink steps).

**Messaging** (`header-message`, `success-message`, `error-message`, `running-message`, `information-message`): consistent status output during setup.

**Git helpers** (`git-branch-name`, `git-sha`, `git-modified-files-count`, `git-staged-files-count`, `git-untracked-files-count`): available for use in a custom prompt or scripts.

**System** (`switch-shell-to-fish`, `reboot-system`, `confirm-reboot-system`, `create-directory-if-not-exists`, `delete-if-exists`, `make-symlink`).

**Setup helpers**:

- `install-sesh`: installs the sesh session manager via `go`.
- `authenticate-github`: runs `gh auth status` to check whether the GitHub CLI is already authenticated; if not, runs `gh auth login`.
- `install-tmux-plugin-manager`, `set-gnome-preferences` (Ubuntu), the `clone-*` repo functions, and the `symlink-*` / `make-*` functions.

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
fish -c "source run.fish; install-ghostty"   # or call directly
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
├── ghostty/
│   └── config                  # Terminal config
├── yazi/
│   ├── yazi.toml               # Manager settings
│   ├── theme.toml              # Flavor selection + icon table
│   └── flavors/                # Installed flavor package(s)
├── zellij/
│   ├── config.kdl              # Workspace config
│   └── layouts/                # Layout definitions
├── tmux/
│   └── tmux.conf               # Terminal multiplexer
├── sesh/
│   └── sesh.toml               # tmux session manager
├── hypr/
│   └── monitors.conf           # Monitor configuration (Omarchy)
├── waybar/
│   ├── config.jsonc            # Status bar config (Omarchy)
│   └── style.css               # Status bar styling (Omarchy)
└── assets/
    ├── fonts/                  # SethensSuperCode.ttf
    ├── icons/                  # Custom icons for nvim-web-devicons
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
