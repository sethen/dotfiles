# source globals
GLOBALS=~/globals.sh

[ -f $GLOBALS ] && source $GLOBALS

# set options
setopt AUTOCD
setopt CORRECT
setopt NO_BEEP
setopt PROMPT_SUBST

# set global variables
export HISTFILE=~/.zsh_history
export SAVEHIST=1000

# set right and left prompts
PROMPT='$(prompt_info)'
RPROMPT='$(rprompt_info)'

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

# set npm-packages in PATH if found
if [[ -d $NPM_PACKAGES_DIRECTORY && -d $NPM_PACKAGES_BIN_DIRECTORY ]]; then
	export PATH=$NPM_PACKAGES_BIN_DIRECTORY:$PATH
fi

# set golang specific options and in PATH if found
if [[ -d /usr/local/go ]]; then
	export GOPATH=/home/$USER/go
	export PATH=$PATH:/usr/local/go/bin
	export PATH=$PATH:$GOPATH/bin

	go env -w GO111MODULE=on
fi
