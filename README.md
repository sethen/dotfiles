# Sethen's Dotfiles

> A comprehensive, cross-platform development environment setup powered by Fish shell scripts

These are my dotfiles for setting up a complete development environment from scratch. Take and use anything you want.

## Prerequisites

Before running the dotfiles, ensure you have the following installed:

| Requirement | Installation |
|------------|--------------|
| **Fish Shell** | Arch: `sudo pacman -S fish` <br> macOS: `brew install fish` <br> Ubuntu: `sudo apt install fish` |
| **Git** | Usually pre-installed, otherwise use your package manager |

### OS-Specific Base Requirements

- **Omarchy (Hyprland)**: A base Arch Linux system with Hyprland installed via Omarchy
- **Ubuntu**: Ubuntu 24.10+ with internet connection
- **Darwin**: macOS with Homebrew installed

## Quick Start

```bash
# 1. Clone the repository
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles

# 2. Configure git identity (required!)
git config user.name "Your Name"
git config user.email "your.email@example.com"

# 3. Run the setup
fish run.fish              # Automated full setup
fish run.fish --launcher   # Interactive mode with gum
```

## What Gets Installed

### Development Tools (via Mise)

Mise manages tool versions. The following are installed:

#### Runtimes

| Tool | Description |
|------|-------------|
| bun | JavaScript/TypeScript runtime |
| node | Node.js LTS |
| python | Python latest |
| ruby | Ruby latest |
| go | Go toolchain |
| java | Java JDK |
| rust | Rust toolchain with cargo |
| dotnet | .NET SDK |
| zig | Zig compiler |

#### Build & Development Tools

| Tool | Description |
|------|-------------|
| cmake | Cross-platform build system |
| tree-sitter | Parser generator tool |

#### Container & Infrastructure Tools

| Tool | Description |
|------|-------------|
| docker-cli | Docker CLI |
| docker-compose | Docker Compose |
| kubectl | Kubernetes CLI |
| terraform | Infrastructure as Code |

#### CLI Utilities

| Tool | Description |
|------|-------------|
| fzf | Fuzzy finder |
| fd | Fast file finder |
| ripgrep | Line-oriented search tool |
| gum | CLI framework for prettier scripts |
| zoxide | Smart directory jumper |
| starship | Shell prompt |
| tmux | Terminal multiplexer |
| zellij | Terminal workspace |
| lazygit | Terminal UI for Git |
| lazydocker | Terminal UI for Docker |
| lazyssh | SSH manager |
| gh | GitHub CLI |
| mysql | MySQL client |
| neovim | Modern Vim editor |
| opencode | AI coding assistant |

### Shell & Terminal Configuration

#### Fish Shell

The dotfiles configure Fish shell with:
- Custom configuration in `config.fish`
- Interactive features: zoxide init, starship init, mise activate
- Path management for bun and mise

#### Starship Prompt

Minimal, fast, and customizable prompt with:
- Catppuccin-mocha color palette
- Shows: username, directory, language versions (c, dotnet, golang, nodejs, python, ruby, rust)
- Git status, branch, and commit info

#### Ghostty Terminal

Modern terminal emulator configured with:
- Catppuccin-mocha theme
- 13pt font with custom codepoint mapping (see Fonts below)
- Async backend (epoll)

#### Fonts

A custom coding font is included and installed:

| Font | Description |
|------|-------------|
| SethensSuperCode.ttf | Custom Nerd Font-style font with icon codepoints (U+F000-U+F1B2) |

This font provides terminal icons (nerd font symbols) mapped to private use area codepoints. It's used by:
- Ghostty terminal for icons
- Starship prompt for git/symbol indicators
- Any terminal application needing Nerd Font-style symbols

Copied to platform-specific locations:
- Omarchy/Ubuntu: `~/.local/share/fonts/`
- Darwin: `~/Library/Fonts/`

### Opencode Configuration

AI coding assistant configured in `opencode/opencode.json`:

| Setting | Value |
|---------|-------|
| Theme | catppuccin-mocha |
| Model | opencode/big-pickle |
| Auto-update | enabled |

The dotfiles also include:
- Custom Neovim plugin for Opencode integration
- Zellij layout with "opencode" tab
- Catppuccin-mocha theme in `opencode/themes/`

See [opencode.ai](https://opencode.ai) for more information.

### Zellij Terminal Workspace

Terminal multiplexer and workspace manager:

**Configuration** (`zellij/config.kdl`):
- Default mode: locked
- Plugin: zjstatus (status bar)
- Theme: catppuccin-mocha

**Default Layout** (`zellij/layouts/default.kdl`):
- Custom status bar with mode indicators (normal, locked, resize, pane, tab, scroll, search, rename, session, move, tmux)
- Catppuccin color scheme for all modes
- Default tabs: "nvim" and "opencode"

```
Tab: nvim    → Opens Neovim
Tab: opencode → Opens Opencode AI assistant
```

The status bar shows current mode on the left, tabs in the center, and session name on the right.

### Neovim Configuration

Fully configured Neovim setup using Lua with lazy.nvim plugin management.

#### Plugin Manager
- **lazy.nvim** - Modern plugin manager with lazy loading

#### UI & Appearance

| Plugin | Description |
|--------|-------------|
| catppuccin | Catppuccin-mocha theme |
| nvim-lualine | Statusline plugin |
| nvim-tree | File tree explorer |
| nvim-web-devicons | File icon support |
| alpha-nvim | Start screen |
| nvim-treesitter-context | Show context above functions |

#### Fuzzy Finding

| Plugin | Description |
|--------|-------------|
| telescope | Fuzzy finder |
| telescope-fzf-native | FZF native support |

#### Treesitter & Syntax

| Plugin | Description |
|--------|-------------|
| nvim-treesitter | Syntax highlighting |
| indent-blankline | Indentation guides |
| nvim-ts-autotag | Auto-close HTML/XML tags |
| rainbow-delimiters | Rainbow parentheses |

#### LSP & Completion

| Plugin | Description |
|--------|-------------|
| blink-cmp | Completion menu |
| mason | LSP server manager |
| lspkind | LSP icons |
| smear-cursor | Cursor blending |

#### Git Integration

| Plugin | Description |
|--------|-------------|
| gitsigns | Git signs in gutter |
| lazygit | Git TUI |
| advanced-git-search | Enhanced git search |

#### Editing Enhancements

| Plugin | Description |
|--------|-------------|
| comment | Comment toggling |
| todo-comments | TODO/FIXME highlighting |
| vim-matchup | Match highlighting |
| line-number-change-mode | Relative line numbers |
| player-one | Code focus mode |
| sunglasses | Dim unused code |

#### Productivity

| Plugin | Description |
|--------|-------------|
| oil | File explorer |
| neovim-project | Project management |
| markview | Markdown viewer |
| which-key | Keybinding hints |
| neovim-project | Project awareness |

#### AI Assistance

| Plugin | Description |
|--------|-------------|
| copilot | GitHub Copilot integration |
| opencode | Opencode AI assistant |

#### Mason-Managed LSP Servers

On first Neovim launch, Mason installs these language servers:
- bash-language-server
- dockerfile-language-server
- gopls
- html-css-language-server
- json-lsp
- lua-lsp
- pyright
- ruby-lsp
- rust-analyzer
- sqlls
- tailwindcss-language-server
- typescript-language-server
- yaml-language-server

### Desktop Environment (Omarchy/Hyprland)

When running on Omarchy (Hyprland), these components are configured:

- **Hyprland** - Wayland compositor with custom monitor configuration (see [Omarchy](https://github.com/anomalyco/omarchy) for keybindings and window rules)
- **Waybar** - Status bar with workspaces, system info, and status
- **Mako** - Notification daemon
- **Walker** - Application launcher
- **Ghostty** - Terminal with custom theme

> **Note:** Hyprland keybindings, window rules, animations, and Waybar configuration are managed by [Omarchy](https://github.com/anomalyco/omarchy). The dotfiles handle monitor configuration in `hypr/monitors.conf` and integration with the overall system.

### Platform-Specific Packages

#### Omarchy (Pacman)

| Package | Description |
|--------|-------------|
| brave-browser | Privacy-focused browser |
| vlc | Media player |
| virtualbox | Virtualization |
| postgresql | Database |
| nginx | Web server |
| ffmpeg | Multimedia framework |
| gparted | Partition editor |
| gpick | Color picker |
| font-manager | Font management |
| grub | Boot loader tools |
| mdadm | RAID management |
| openssh | SSH tools |
| ca-certificates | SSL certificates |
| curl | HTTP client |
| fortune-mod | Random fortunes |
| gh | GitHub CLI |

#### Ubuntu (APT + Snap + Flatpak)

**APT Packages:**
| Package | Description |
|--------|-------------|
| brave-browser | Privacy-focused browser |
| vlc | Media player |
| virtualbox | Virtualization |
| postgresql | Database |
| nginx | Web server |
| gparted | Partition editor |
| gpick | Color picker |
| font-manager | Font management |
| autoconf | Build tool |
| bison | Parser generator |
| build-essential | Development tools |
| ca-certificates | SSL certificates |
| gnupg | Encryption |
| gnome-tweaks | GNOME customization |
| lsb-release | System info |
| mdadm | RAID management |
| fortune-mod | Random fortunes |
| gh | GitHub CLI |

**Snap Packages:**
| Package | Description |
|--------|-------------|
| discord | Communication |
| spotify | Music streaming |

**Flatpak Packages:**
| Package | Description |
|--------|-------------|
| zen-browser | Privacy-focused browser |
| flatpak | Package framework |

**Custom Installations:**
| Package | Description |
|--------|-------------|
| ghostty | Terminal emulator (via .deb) |
| White Sur icon theme | GNOME icons |

#### Darwin/macOS (Homebrew)

**CLI Tools:**
| Package | Description |
|--------|-------------|
| curl | HTTP client |
| gh | GitHub CLI |
| git | Version control |
| gnupg | Encryption |
| libyaml | YAML library |
| nginx | Web server |

**GUI Applications:**
| Package | Description |
|--------|-------------|
| brave-browser | Privacy-focused browser |
| ghostty | Terminal emulator |
| spotify | Music streaming |
| virtualbox | Virtualization |

## How It Works

### Entry Point: run.fish

The `run.fish` script is the main entry point:

1. **OS Detection** - Detects the operating system (omarchy, darwin, ubuntu)
2. **Path Setup** - Sets up dotfiles and home directory paths
3. **Function Loading** - Loads Fish functions from OS directories
4. **Phase Execution** - Runs pre, main, and post phases

### Setup Phases

```
run.fish
├── Pre Phase (pre/)
│   ├── Create directories (~/.config, ~/Developer, etc.)
│   ├── Symlink configuration files
│   └── Install base dependencies (mise, curl, git)
├── Main Phase (main/)
│   ├── Install OS packages (pacman/apt/brew)
│   ├── Install mise tools
│   ├── Install language servers
│   └── Clone repositories
└── Post Phase (post/)
    └── Final configuration
```

### Symlink Structure

Configuration files are symlinked to `~/.config/`:

| Source | Destination |
|--------|-------------|
| `config.fish` | `~/.config/fish/config.fish` |
| `fish/functions/` | `~/.config/fish/functions/` |
| `nvim/` | `~/.config/nvim/` |
| `starship/starship.toml` | `~/.config/starship.toml` |
| `ghostty/` | `~/.config/ghostty/` |
| `hypr/` | `~/.config/hypr/` |
| `waybar/` | `~/.config/waybar/` |
| `tmux/tmux.conf` | `~/.config/tmux/tmux.conf` |
| `zellij/` | `~/.config/zellij/` |
| `sesh/sesh.toml` | `~/.config/sesh/config.toml` |
| `.gitconfig` | `~/.gitconfig` |

## Custom Fish Functions

The dotfiles include custom Fish functions for common operations:

### Messaging Functions

| Function | Description |
|----------|-------------|
| `header-message` | Print header with formatting |
| `success-message` | Print success message |
| `error-message` | Print error message |
| `running-message` | Print running status |
| `information-message` | Print info message |

### Git Helper Functions

| Function | Description |
|----------|-------------|
| `git-branch-name` | Get current branch name |
| `git-sha` | Get current commit SHA |
| `git-modified-files-count` | Count modified files |
| `git-staged-files-count` | Count staged files |
| `git-untracked-files-count` | Count untracked files |

### System Functions

| Function | Description |
|----------|-------------|
| `reboot-system` | Reboot the system |
| `confirm-reboot-system` | Reboot with confirmation |
| `switch-shell-to-fish` | Switch default shell to fish |
| `create-directory-if-not-exists` | Create directory safely |
| `delete-if-exists` | Delete file/directory safely |

### Interactive Launcher

| Function | Description |
|----------|-------------|
| `dot-launcher` | Interactive menu to run individual functions |

The interactive launcher (`--launcher` flag) uses gum to present a filterable list of all available functions. Available functions include:

**Package Installation:**
- `install-brave`, `install-brave-browser` - Brave browser
- `install-curl`, `install-gh`, `install-git`, `install-nginx`, `install-openssh`
- `install-vlc`, `install-virtualbox`, `install-postgresql`
- `install-font-manager`, `install-ffmpeg`, `install-gparted`, `install-gpick`
- `install-discord`, `install-spotify` - Snap packages (Ubuntu)
- `install-flatpak`, `install-zen` - Flatpak packages (Ubuntu)
- `install-ghostty` - Terminal emulator
- `install-homebrew` - Package manager (Darwin)

**Tool Installation (via Mise):**
- `install-bash-language-server`, `install-fish-lsp`
- `install-typescript`, `install-typescript-language-server`
- `install-yaml-language-server`, `install-vscode-langservers-extracted`

**Repository Cloning:**
- `clone-dotfiles-repo` - Clones dotfiles to ~/dotfiles
- `clone-wallpapers-repo` - Wallpapers repository
- `clone-white-sur-icon-theme-repo` - Icon theme (Ubuntu)

**Configuration:**
- `install-tmux-plugin-manager` - TPM setup
- `set-gnome-preferences` - GNOME settings (Ubuntu)
- Various `symlink-*` functions - Create config symlinks
- Various `make-*` functions - Create required directories

## Environment Variables

The dotfiles set the following environment variables:

| Variable | Default | Description |
|----------|---------|-------------|
| `DEVELOPER_DIRECTORY` | `$HOME/Developer` | Working directory for projects |
| `BUN_INSTALL` | `$HOME/.bun` | Bun installation directory |
| `DOTFILES_DIRECTORY` | (cwd) | Path to dotfiles repo |
| `MISE_INSTALL_PATH` | (from mise) | Mise binary path |

## Advanced Usage

### Run Individual Phases

```bash
# Pre-installation (create dirs, symlinks)
fish -c "source run.fish; run-omarchy-pre"
fish -c "source run.fish; run-ubuntu-pre"
fish -c "source run.fish; run-darwin-pre"

# Main installation (packages, tools)
fish -c "source run.fish; run-omarchy-main"
fish -c "source run.fish; run-ubuntu-main"
fish -c "source run.fish; run-darwin-main"

# Post-configuration
fish -c "source run.fish; run-common-post"
```

### Run Specific Functions

```bash
# Using the interactive launcher
fish run.fish --launcher

# Or source and call functions directly
fish -c "source run.fish; install-neovim"
```

### Update Existing Setup

```bash
fish run.fish --update
```

### Reboot After Setup

```bash
fish run.fish --reboot
```

## Project Structure

```
dotfiles/
├── run.fish                    # Main entry point
├── config.fish                 # Fish shell configuration
├── .gitconfig                  # Git configuration
├── AGENTS.md                   # Agent coding guidelines
├── fish/
│   └── functions/              # Custom Fish functions
├── os/
│   ├── omarchy/                # Arch/Hyprland specific
│   │   ├── pre/               # Pre-installation
│   │   ├── main/              # Package installation
│   │   └── utilities/         # Helper functions
│   ├── darwin/                # macOS specific
│   ├── ubuntu/                # Ubuntu specific
│   └── common/                # Cross-platform
│       ├── pre/               # Common pre-scripts
│       ├── main/              # Common install scripts
│       ├── post/              # Post-configuration
│       └── utilities/         # Shared utilities
├── nvim/                       # Neovim configuration (Lua)
├── opencode/                   # Opencode AI assistant config
│   └── lua/sethen/
│       ├── core/              # Core settings
│       ├── plugins/           # Plugin configurations
│       └── lazy.lua           # Plugin manager setup
├── mise/
│   └── mise.toml              # Tool versions
├── starship/
│   └── starship.toml          # Prompt configuration
├── ghostty/
│   ├── config                 # Terminal config
│   └── themes/                # Terminal themes
├── tmux/
│   └── tmux.conf              # Terminal multiplexer
├── hypr/
│   └── monitors.conf          # Monitor configuration
├── waybar/
│   ├── config.jsonc           # Status bar config
│   └── style.css             # Status bar styling
├── zellij/
│   ├── config.kdl             # Terminal workspace config
│   └── layouts/              # Layout definitions
├── sesh/
│   └── sesh.toml              # Tmux session manager
└── assets/
    ├── fonts/
    │   └── SethensSuperCode.ttf  # Custom coding font with nerd font icons
    ├── icons/                 # 435 custom icons for nvim-web-devicons
    ├── images/                # Screenshot images
    └── videos/               # Demo videos
```

## Customization

### Adding New Mise Tools

Edit `mise/mise.toml`:

```toml
[tools]
your-tool = "latest"  # or specific version
```

### Adding Neovim Plugins

Add to any file in `nvim/lua/sethen/plugins/`:

```lua
return {
  "owner/repo",
  event = "VeryLazy",
  config = function()
    -- your config
  end,
}
```

### Adding Platform-Specific Packages

**Arch (Omarchy):** Add to `os/omarchy/main/run-omarchy-main.fish`

**Ubuntu:** Add to `os/ubuntu/main/run-ubuntu-main.fish` (apt, snap, or flatpak)

**Darwin:** Add to `os/darwin/main/run-darwin-main.fish`

### Customizing Fish Functions

Add new functions to `fish/functions/` or the appropriate OS directory.

## Troubleshooting

### Common Issues

**Symlink already exists:**
The scripts are idempotent and will skip existing files. To force recreation, delete the target first.

**Mise not found:**
Ensure Fish is properly initialized with mise. The `config.fish` sources mise activation.

**Neovim plugins not loading:**
Run `:Lazy sync` in Neovim to install/update plugins.

**Language servers not starting:**
Run `:LspInstallLog` in Neovim to check for errors. Ensure Mason servers are installed with `:LspInstall`.

### Verification Commands

```bash
# Test Fish configuration
fish -n run.fish

# Verify Neovim loads
nvim --headless -c "lua require('sethen')" -c "qa"

# Check mise installation
mise doctor

# Validate starship config
starship config validate

# List installed mise tools
mise ls
```

---

**Made with care by [Sethen](https://github.com/sethen)**
