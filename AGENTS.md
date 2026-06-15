# Agents.md - Repository Guide for Agentic Coding Assistants

This repository contains personal dotfiles for setting up a development environment from scratch. It's primarily written in Fish shell scripts with Lua configuration for Neovim.

## Repository Structure

- **`run.fish`** - Main entry point that detects OS and launches appropriate setup scripts
- **`os/{darwin,omarchy,ubuntu}/`** - OS-specific installation and configuration scripts
- **`os/common/`** - Cross-platform utilities and shared functionality
- **`fish/functions/`** - Reusable Fish shell functions for messaging, filesystem helpers (`make-symlink`, `create-directory-if-not-exists`, `delete-if-exists`), and git status helpers
- **`nvim/`** - Neovim configuration using Lua with lazy.nvim plugin management
- **`mise/`** - Development tool version management configuration
- **`starship/`** - Shell prompt customization
- **`ghostty/`** - Terminal emulator configuration
- **`tmux/`** - Terminal multiplexer settings
- **`zellij/`** - Alternate terminal multiplexer with custom layouts
- **`sesh/`** - Session manager (integrates with tmux)
- **`yazi/`** - Terminal file manager configuration
- **`hypr/`** - Hyprland (Wayland compositor) overrides (Omarchy)
- **`waybar/`** - Status bar configuration (Omarchy)
- **`opencode/`** - opencode AI assistant configuration and themes

## Build/Test/Validation Commands

### Fish Scripts
```bash
# Test individual fish functions
fish -c "source path/to/script.fish; function-name"

# Validate fish syntax
fish -n path/to/script.fish

# Run the main launcher
./run.fish
./run.fish --launcher  # Interactive mode
```

### Neovim Configuration
```bash
# Test Neovim configuration
nvim --headless -c "lua require('sethen.core')" -c "qa"

# Check for Lua syntax errors
lua -c "require('path/to/module')"

# Validate plugin specifications
nvim --headless -c "Lazy check" -c "qa"
```

### Configuration Validation
```bash
# Validate starship config
starship config validate

# Check mise configuration
mise doctor

# Validate TOML files
mise run --dry-run  # If available
```

## Code Style Guidelines

### Fish Shell Scripts

**Imports & Dependencies:**
- All scripts must start with `#!/usr/bin/env fish`
- Use `source` or direct function calls for dependencies
- Functions should be self-contained with minimal dependencies

**Naming Conventions:**
- Functions: `kebab-case` with descriptive names (e.g., `header-message`, `git-branch-name`)
- Variables: `UPPER_SNAKE_CASE` for globals, `lower_snake_case` for locals
- Files: `kebab-case.fish`

**Code Structure:**
```fish
#!/usr/bin/env fish

function function-name
    # Argument validation
    if test (count $argv) -eq 0
        error-message "usage: function-name <argument>"
        return 1
    end

    set -l variable value  # Local variables

    # Main logic
    # ...
end
```

**Error Handling:**
- Always validate arguments and provide usage messages
- Use `>&2` for error messages
- Return non-zero exit codes on errors
- Use conditional execution with `and`/`or`

**Messaging System:**
- Use provided messaging functions: `header-message`, `success-message`, `error-message`, etc.
- Consistent color coding and formatting across all scripts

### Lua Configuration (Neovim)

**Imports & Module Structure:**
```lua
-- Use local variables for modules
local keymaps = require('sethen.core.keymaps')
local telescope = require('telescope')

-- Module returns should be tables
return {
   plugin_name = 'repo/plugin',
   config = function()
      -- Configuration logic
   end,
   keys = { /* keybindings */ },
   dependencies = { /* dependencies */ }
}
```

**Naming Conventions:**
- Files: `kebab-case.lua`
- Variables: `snake_case`
- Functions: `snake_case`
- Constants: `UPPER_SNAKE_CASE`

**Code Style:**
- 3-space indentation (consistent with existing code)
- Use string concatenation with `..` operator
- Prefer `local` over global variables
- Use vim.opt for options, vim.o for single options

**Plugin Configuration:**
- Use lazy.nvim plugin specification format
- Include dependencies as arrays
- Use `keys` for keybinding declarations
- Separate `config` functions for complex setups

### TOML Configuration

**Style Guidelines:**
- Use double quotes for string values
- Maintain consistent indentation (2 spaces)
- Group related settings together
- Use descriptive section headers

**File Organization:**
- Keep tool-specific configs in their respective directories
- Use `[tools]` section for version specifications in mise.toml
- Include schema references where available

## Development Workflow

1. **Testing Changes:**
   - Test fish scripts in isolated environment before integration
   - Use `--dry-run` flags where available for package installations
   - Validate Neovim configuration in headless mode

2. **OS Compatibility:**
   - Test changes on target OS (Omarchy, Darwin, Ubuntu)
   - Use OS-specific directories for platform-dependent code
   - Common functionality should go in `os/common/`

3. **Installation Order:**
   - Pre-installation scripts in `pre/` directories
   - Main installations in `main/` directories  
   - Post-configuration in `post/` directories
   - Utilities are shared across phases

## Important Conventions

- **No interactive prompts** unless using gum/fzf for selection
- **Idempotent operations** - scripts should handle re-runs gracefully
- **Error propagation** - use proper exit codes and error messages
- **Logging** - use standardized messaging functions for consistent output
- **Modularity** - each function should do one thing well
- **Documentation** - include usage examples in function comments when needed

## Tools & Dependencies

The repository relies on these core tools:
- `fish` shell for scripting
- `mise` for version management
- `neovim` for text editing
- `starship` for shell prompt
- `git` for version control
- `gum` for interactive CLI elements
- `ghostty` terminal emulator

Ensure all dependencies are installed before testing changes to the dotfiles setup.