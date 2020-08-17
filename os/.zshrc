# source globals
GLOBALS=~/globals.sh

[ -f $GLOBALS ] && source $GLOBALS

# set variables
export EDITOR=nvim
export HISTFILE=~/.zsh_history
export SAVEHIST=1000

# set options
setopt AUTOCD
setopt CORRECT
setopt NO_BEEP
setopt PROMPT_SUBST

# set right and left prompts
PROMPT='$(prompt_info)'
RPROMPT='$(rprompt_info)'

# set styles
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{3}%B%d%b%f'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' menu select=2

# set initial directory
if [[ -d $DEVELOPER_DIRECTORY ]]; then
	cd $DEVELOPER_DIRECTORY
fi

# source if found
[ -f $ALIASES ] && source $ALIASES
[ -f $FZF ] && source $FZF
[ -f $ZSH_AUTOSUGGESTIONS ] && source $ZSH_AUTOSUGGESTIONS

# set rust in PATH if found
if [[ -d $CARGO_BIN_DIRECTORY ]]; then
	export PATH=$CARGO_BIN_DIRECTORY:$PATH
fi

# set go in PATH if found
if [[ -a $GO_BIN && -d $DEVELOPER_GO_DIRECTORY ]]; then
	export GOPATH=$DEVELOPER_GO_DIRECTORY
	export PATH=$DEVELOPER_GO_DIRECTORY:$DEVELOPER_GO_DIRECTORY/bin:$PATH
fi

# set dotnet in PATH if found
if [[ -d $DOTNET_DIRECTORY && $DOTNET_TOOLS_DIRECTORY ]]; then
	export PATH=$DOTNET_TOOLS_DIRECTORY:$PATH
fi

# set npm-packages in PATH if found
if [[ -d $NPM_PACKAGES_DIRECTORY && -d $NPM_PACKAGES_BIN_DIRECTORY ]]; then
	export PATH=$NPM_PACKAGES_BIN_DIRECTORY:$PATH
fi

# set rbenv for ruby in PATH if found
if [[ -d $RBENV_BIN_DIRECTORY ]]; then
	export PATH=$RBENV_BIN_DIRECTORY:$PATH
	eval "$(rbenv init -)"
fi

# set for buku
export PATH=~/.local/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
