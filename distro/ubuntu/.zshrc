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

# set nvm
if [[ -d $NVM_DIRECTORY ]]; then
    [ -s $NVM_DIRECTORY/nvm.sh ] && \. $NVM_DIRECTORY/nvm.sh
    [ -s $NVM_DIRECTORY/bash_completion ] && \. $NVM_DIRECTORY/bash_completion
fi

# set rust
if [[ -d $CARGO_BIN_DIRECTORY ]]; then
  export PATH=$CARGO_BIN_DIRECTORY:$PATH
fi
