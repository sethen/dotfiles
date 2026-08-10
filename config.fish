if type -q fortune
    set -g fish_greeting (fortune)
else
    set -g fish_greeting "Only worry about the things that you can control."
end

# load per-user values captured during setup (git-ignored; see configure-user)
set -l dotfiles_user_config (dirname (path resolve (status filename)))/user.fish
test -f $dotfiles_user_config; and source $dotfiles_user_config

if not set -q DEVELOPER_DIRECTORY
    set -gx DEVELOPER_DIRECTORY $HOME/Developer
end

set -gx BUN_INSTALL $HOME/.bun

fish_add_path -m $BUN_INSTALL/bin
fish_add_path -m $HOME/.local/bin

test -x /opt/homebrew/bin/brew; and fish_add_path -m /opt/homebrew/bin
test -x /usr/local/bin/brew; and fish_add_path -m /usr/local/bin

if type -q mise
    mise activate fish | source
end

if status is-interactive
    if type -q starship
        starship init fish | source
    end
end
