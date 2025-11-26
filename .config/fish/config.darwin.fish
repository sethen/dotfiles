set -U fish_greeting (fortune || "Only worry about the things that you can control.")

# directories
set -gx DEVELOPER_DIRECTORY $HOME/Developer
set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml

# darwin
set -gx DARWIN_FONTS_DIRECTORY $HOME/Library/Fonts

# set path
set -gx PATH /usr/bin $PATH

# asdf
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end

set --erase _asdf_shims

# start in ~/Developer
if status is-interactive
    cd ~/Developer
end

starship init fish | source
