set -U fish_greeting (fortune || "Only worry about the things that you can control.")

set -l BUN_BIN $HOME/.bun/bin
set -gx DEVELOPER_DIRECTORY $HOME/Developer
set -l HOME_LOCAL_BIN_DIRECTORY $HOME/.local/bin
set -l HOME_LOCAL_MISE_BIN $HOME_LOCAL_BIN_DIRECTORY/mise
set -l USR_BIN_DIRECTORY /usr/bin

fish_add_path -m $BUN_BIN
fish_add_path -m $HOME_LOCAL_BIN_DIRECTORY
fish_add_path -m $USR_BIN_DIRECTORY

if test -f $HOME_LOCAL_MISE_BIN
  $HOME_LOCAL_MISE_BIN activate fish | source
end

if status is-interactive
  cd $DEVELOPER_DIRECTORY

  if type -q starship
    starship init fish | source
  end
end
