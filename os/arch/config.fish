set -U fish_greeting (fortune || "Only worry about the things that you can control.")

# directories
set -gx ARCH_FONTS_DIRECTORY ~/.local/share/fonts
set -gx BUN_BIN $HOME/.bun/bin
set -gx DEVELOPER_DIRECTORY $HOME/Developer
set -gx MISE_BIN $HOME/.local/bin/mise

fish_add_path /usr/bin

if test -f $MISE_BIN
  $MISE_BIN activate fish | source
end

if test -f $BUN_BIN
  fish_add_path -m $BUN_BIN
end

# start in ~/Developer
if status is-interactive
  cd ~/Developer

  if type -q starship
    starship init fish | source
  end
end
