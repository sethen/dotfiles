if type -q fortune
    set -g fish_greeting (fortune)
else
    set -g fish_greeting "Only worry about the things that you can control."
end

set -gx DEVELOPER_DIRECTORY $HOME/Developer
set -gx BUN_INSTALL $HOME/.bun

fish_add_path -m $BUN_INSTALL/bin
fish_add_path -m $HOME/.local/bin

test -x /opt/homebrew/bin/brew; and fish_add_path -m /opt/homebrew/bin
test -x /usr/local/bin/brew; and fish_add_path -m /usr/local/bin

if type -q mise
    mise activate fish | source
end

if status is-interactive
    if type -q zoxide
        zoxide init fish | source
    end

    if type -q starship
        starship init fish | source
    end
end
