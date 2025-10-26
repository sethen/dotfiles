set -U fish_greeting (fortune || "Only worry about the things that you can control.")

# directories
set -gx DEVELOPER_DIRECTORY $HOME/Developer
set -gx ETC_APT_SOURCES_DIRECTORY /etc/apt/sources.list.d
set -gx FONTS_DIRECTORY $HOME/.fonts
set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml

# bob
set -gx NVIM_BIN_DIRECTORY $HOME/.local/share/bob/nvim-bin

# golang
set -gx GO_BIN_DIRECTORY $HOME/go/bin

# npm
set -gx NVM_DIRECTORY $HOME/.nvm
set -gx NVM_VERSION 0.39.3

# nvm
set -gx NVM_FISH_FILE $HOME/.config/fish/functions/nvm.fish
set -gx NVM_BIN_DIRECTORY $HOME/.local/share/nvm/v24.9.0/bin
set --universal nvm_default_version latest

# ruby
set -gx GEM_BIN_DIRECTORY $HOME/.gem/ruby/3.3.0/bin

# rust
set -gx CARGO_BIN_DIRECTORY $HOME/.cargo/bin

set -l dev_paths \
  $CARGO_BIN_DIRECTORY \
  $GO_BIN_DIRECTORY \
  $GEM_BIN_DIRECTORY \
  $NVIM_BIN_DIRECTORY \
  $NVM_BIN_DIRECTORY \
  /usr/bin

cd ~/Developer

starship init fish | source
