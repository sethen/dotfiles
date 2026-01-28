set -U fish_greeting (fortune || "Only worry about the things that you can control.")

# directories
set -gx ARCH_FONTS_DIRECTORY ~/.local/share/fonts
set -gx DEVELOPER_DIRECTORY $HOME/Developer
set -gx MISE_BIN $HOME/.local/bin/mise
set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml

if test -f $MISE_BIN
  $MISE_BIN activate fish | source
end

set -gx PATH /usr/bin $PATH

# start in ~/Developer
if status is-interactive
  cd ~/Developer

  if type -q starship
    starship init fish | source
  end
end
