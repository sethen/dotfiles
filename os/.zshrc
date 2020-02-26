# source globals
GLOBALS=~/globals.sh

[ -f $GLOBALS ] && source $GLOBALS

# set variables
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
if [[ -d $DEVELOPER ]]; then
	cd $DEVELOPER
fi

# source if found
[ -f $HOME_ALIASES ] && source $HOME_ALIASES
[ -f $FZF ] && source $FZF
[ -f $ZSH_AUTOSUGGESTIONS ] && source $ZSH_AUTOSUGGESTIONS

# set rust in PATH if found
if [[ -d $HOME_CARGO_BIN ]]; then
	export PATH=$HOME_CARGO_BIN:$PATH
fi

# set go in PATH if found
if [[ -a $GO_BIN && -d $DEVELOPER_GO ]]; then
	export GOPATH=$DEVELOPER_GO
	export PATH=$DEVELOPER_GO:$DEVELOPER_GO/bin:$PATH
fi

# set rbenv for ruby in PATH if found
if [[ -d $HOME_RBENV_BIN ]]; then
	export PATH=$HOME_RBENV_BIN:$PATH
	eval "$(rbenv init -)"
fi
