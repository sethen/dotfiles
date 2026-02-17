set -U fish_greeting (fortune || "Only worry about the things that you can control.")

set -gx DEVELOPER_DIRECTORY $HOME/Developer
set -gx BUN_INSTALL $HOME/.bun

fish_add_path -m $BUN_INSTALL/bin
fish_add_path -m $HOME_LOCAL_BIN_DIRECTORY

mise activate fish | source

if status is-interactive
    if type -q zoxide
        zoxide init fish | source
    end

    if type -q starship
        starship init fish | source
    end
end
