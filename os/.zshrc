# source .aliases, fzf and other completions
source ~/.aliases
source ~/.fzf.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# set global variables
export CARGO_PATH=~/.cargo/bin
export GOPATH=$HOME/Developer/go
export HISTFILE=~/.zsh_history
export NPM_GLOBAL_PATH=~/.npm-global/bin
export SAVEHIST=1000
export RUBY_VERSION=2.6.1
export RUBY_PATH=~/.rbenv/bin
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src
export TERM=xterm-256color
export PATH=$RUBY_PATH:$CARGO_PATH:$NPM_GLOBAL_PATH:$GOPATH/bin:$PATH

# set right and left prompts
PROMPT='$(prompt_info)'
RPROMPT='$(rprompt_info)'

# set options
setopt AUTOCD
setopt CORRECT
setopt NO_BEEP
setopt PROMPT_SUBST

# set styles
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{3}%B%d%b%f'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' menu select=2

# set rbenv
eval "$(rbenv init -)"

# start in Developer directory
cd ~/Developer
