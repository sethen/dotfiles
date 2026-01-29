set -U fish_greeting (fortune || "Only worry about the things that you can control.")

# directories
set -gx DEVELOPER_DIRECTORY $HOME/Developer
set -gx ETC_APT_SOURCES_DIRECTORY /etc/apt/sources.list.d
set -gx MISE_BIN $HOME/.local/bin/mise
set -gx UBUNTU_FONTS_DIRECTORY $HOME/.fonts

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
