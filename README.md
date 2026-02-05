# 🚀 Sethen's Dotfiles

> A comprehensive, cross-platform development environment setup powered by Fish shell scripts

These are my dotfiles for setting up my environment from nothing. Take and use anything you want.

# ✨ Features

- **🐟 Fish-Powered**: Modern shell scripting with Fish's clean syntax and powerful features
- **🌍 Cross-Platform**: Supports Arch Linux, macOS (Darwin), and Ubuntu 24.10+
- **🎯 Modular Design**: Each script does one thing well - install Neovim, configure Git, set up tools, etc.
- **🚀 Interactive Launcher**: Beautiful gum-powered interface for selecting what to install
- **⚡ Idempotent**: Safe to run multiple times without breaking things
- **🛠️ Dev-Ready**: Comes pre-configured with Neovim, Tmux, Starship, Ghostty, and more

## 🖥️ Environment Showcase

### Ghostty + Starship + Fish
A modern terminal experience with a sleek prompt and powerful shell capabilities
![image](assets/images/terminal.png)

### Interactive Dot Launcher
Beautiful gum-powered interface for selecting exactly what to install. Run everything at once or pick individual components.

### Neovim Configuration
A fully configured Neovim setup with Lua, LSP, TreeSitter, and modern plugin management
![image](assets/images/neovim.png)

# 🚀 Quickstart

Get your development environment running in minutes:

```bash
# 1. Install Fish shell (choose your package manager)
# Arch/Manjaro:    sudo pacman -S fish
# macOS:           brew install fish
# Ubuntu:          sudo apt install fish

# 2. Clone and navigate to the dotfiles
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles

# 3. Configure your git identity (important!)
git config user.name "Your Name"
git config user.email "your.email@example.com"

# 4. Run the interactive launcher 🎉
fish run.fish --launcher
```

> **Pro Tip**: Run `fish run.fish` directly for a full automated setup, or use `--launcher` for the interactive experience!

# 🌍 Supported Environments

| Platform | Status | Notes |
|----------|--------|-------|
| **Arch Linux** | ✅ Full Support | Can be run before desktop environment setup |
| **macOS** | ✅ Full Support | Tested on latest macOS versions |
| **Ubuntu 24.10+** | ✅ Full Support | Works on recent Ubuntu releases |

## 📁 What Gets Installed?

### Core Development Tools
- **Neovim** - Modern Vim configuration with Lua, LSP, and plugins
- **Git** - Version control with sensible defaults
- **Tmux** - Terminal multiplexer for productivity
- **Mise** - Development tool version management
- **Ghostty** - Modern terminal emulator

### Shell Experience
- **Fish Shell** - Interactive shell with smart completions
- **Starship** - Minimal, fast, and customizable prompt
- **Custom Functions** - Git helpers, system utilities, and more

### Language Support (managed via mise)
- **DotNET** - .NET development
- **Go** - Go language toolchain
- **Java** - JVM development
- **Lua** - For Neovim configuration
- **Node.js & Bun** - Modern JavaScript/TypeScript runtimes
- **Python** - Python development with pip
- **Ruby** - Ruby on Rails development
- **Rust** - Systems programming with Cargo
- **SQL** - Database development with PostgreSQL/MySQL
- **Zig** - Modern systems programming

### Development Tools & Utilities
- **cmake** - Build system essentials
- **Docker & Docker Compose** - Container development
- **fd, ripgrep, fzf** - Modern CLI file tools
- **GitHub CLI (gh)** - GitHub command line tools
- **kubectl** - Kubernetes CLI
- **LazyGit & LazyDocker** - Terminal UIs for Git/Docker
- **Terraform** - Infrastructure as Code
- **zoxide** - Smart directory navigation

### LSP & Language Servers
- **Global LSPs**: bash, typescript, yaml via bun
- **Mason-managed**: Docker, Go, HTML/CSS, JSON, Python, Ruby, Rust, SQL, Tailwind

### Desktop Applications & System Components

## **Arch Linux**
**Package Manager:** pacman + yay (AUR)

**System & Development:**
- **base & base-devel** - Core system and development tools
- **btrfs-progs** - BTRFS filesystem utilities
- **ca-certificates** - SSL certificates
- **cmake & autoconf & bison** - Build tools
- **curl** - Data transfer utility
- **dotnet-sdk** - .NET development SDK
- **efibootmgr** - EFI boot manager
- **ffmpeg** - Multimedia framework
- **gh** - GitHub CLI
- **git** - Version control
- **gnupg** - Encryption tools
- **linux & linux-firmware** - Kernel and firmware
- **lsb-release & man** - System info and documentation
- **mdadm** - Software RAID tools
- **networkmanager** - Network management
- **openssh** - SSH client/server
- **postgresql** - PostgreSQL database
- **sesh** - Tmux session manager
- **sudo** - Privilege escalation
- **vscode-langservers-extracted** - VSCode language servers

**Desktop & GUI:**
- **discord** - Communication platform
- **font-manager** - Font management
- **fortune-mod** - Random fortunes
- **ghostty** - Modern terminal
- **gparted** - Partition editor
- **gpick** - Color picker
- **grub** - Bootloader
- **hyprland** - Wayland compositor
- **signal-desktop** - Secure messaging
- **sddm** - Display manager
- **spotify** - Music streaming
- **starship** - Shell prompt
- **systemsettings** - KDE settings
- **virtualbox** - Virtualization
- **vlc** - Media player

**Audio System:**
- **pipewire** (plus alsa, jack, pulse) - Multimedia framework
- **wireplumber** - Session manager

**Web Server:**
- **nginx** - High-performance web server

## **Darwin/macOS**
**Package Manager:** Homebrew (formulae + casks)

**CLI Tools:**
- **curl** - Data transfer utility
- **gh** - GitHub CLI
- **git** - Version control
- **gnupg** - Encryption tools
- **libyaml** - YAML parsing library
- **nginx** - Web server

**GUI Applications:**
- **brave-browser** - Privacy-focused browser
- **ghostty** - Modern terminal
- **spotify** - Music streaming
- **virtualbox** - Virtualization

## **Ubuntu**
**Package Manager:** APT + Snap + Flatpak + custom .deb

**APT Packages:**
- **autoconf & bison** - Build tools
- **brave-browser** - Privacy-focused browser
- **build-essential** - Development tools
- **ca-certificates** - SSL certificates
- **curl** - Data transfer utility
- **font-manager** - Font management
- **fortune-mod** - Random fortunes
- **gh** - GitHub CLI
- **git** - Version control
- **gnome-software-plugin-flatpak** - Flatpak support
- **gnome-tweaks** - GNOME customization
- **gnupg** - Encryption tools
- **gparted** - Partition editor
- **gpick** - Color picker
- **lsb-release** - System info
- **mdadm** - Software RAID tools
- **nginx** - Web server
- **postgresql** - PostgreSQL database
- **virtualbox** - Virtualization
- **vlc** - Media player

**Snap Packages:**
- **discord** - Communication platform
- **spotify** - Music streaming

**Flatpak Packages:**
- **app.zen_browser.zen** - Zen Browser (privacy-focused)
- **flatpak** - Flatpak framework

**Custom Installations:**
- **ghostty** - Modern terminal (via .deb)
- **White Sur icon theme** - GNOME customization

## 🛠️ Advanced Usage

### Run Individual Components
```bash
# Run specific setup phases
fish -c "source run.fish; run-arch-pre"      # Pre-installation setup
fish -c "source run.fish; run-arch-main"     # Main installations
fish -c "source run.fish; run-arch-post"     # Post-configuration
```

### Update Existing Setup
```bash
fish run.fish --update  # Update all installed packages
```

### Reboot After Setup
```bash
fish run.fish --reboot  # Automatically reboot when done
```

## 📖 Project Structure

```
dotfiles/
├── run.fish                    # Main entry point - detects OS and launches setup
├── fish/functions/             # Reusable Fish shell functions
├── os/
│   ├── arch/                   # Arch Linux specific scripts
│   ├── darwin/                 # macOS specific scripts
│   ├── ubuntu/                 # Ubuntu specific scripts
│   └── common/                 # Cross-platform utilities
├── nvim/                       # Neovim configuration (Lua)
├── mise/                       # Development tool versions
├── starship/                   # Shell prompt configuration
├── ghostty/                    # Terminal emulator settings
└── tmux/                       # Terminal multiplexer configuration
```

## 🤝 Contributing

Found an issue or have an improvement? Feel free to:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly on your target platform
5. Submit a pull request

---

**Made with ❤️ by [Sethen](https://github.com/sethen)**
