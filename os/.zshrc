# set options
setopt AUTOCD
setopt CORRECT
setopt NO_BEEP
setopt PROMPT_SUBST

# set global variables
export HISTFILE=~/.zsh_history
export SAVEHIST=1000

# set right and left prompts
PROMPT='$(prompt-info)'
RPROMPT='$(rprompt-info)'

# set styles
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{3}%B%d%b%f'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' menu select=2

# source if found
[ -f $ALIASES ] && source $ALIASES
[ -f $ZSH_AUTOSUGGESTIONS ] && source $ZSH_AUTOSUGGESTIONS

# set initial directory
if [[ -d $DEVELOPER_DIRECTORY ]]; then
    cd $DEVELOPER_DIRECTORY
fi

# source chruby and switch to ruby version
if [[ -f $CHRUBY_SHELL_FILE && -f $RUBY_BIN ]]; then
    . $CHRUBY_SHELL_FILE
    chruby ruby-$RUBY_VERSION
fi

# set golang
if [[ -d $GO_USR_LOCAL_BIN_DIRECTORY && -f $GO_BIN ]]; then
    export PATH=$GO_USR_LOCAL_BIN_DIRECTORY:$PATH
    export PATH=$GO_BIN_DIRECTORY:$PATH
fi

# set neovim
if [[ -d $NVIM_BIN ]]; then
    export PATH=$NVIM_BIN:$PATH
fi
#
# set nvm
if [[ -d $NVM_DIRECTORY ]]; then
    [ -s $NVM_DIRECTORY/nvm.sh ] && \. $NVM_DIRECTORY/nvm.sh
    [ -s $NVM_DIRECTORY/bash_completion ] && \. $NVM_DIRECTORY/bash_completion
fi

# set rust
if [[ -d $CARGO_BIN_DIRECTORY ]]; then
    export PATH=$CARGO_BIN_DIRECTORY:$PATH
fi

