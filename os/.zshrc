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
DEVELOPER=~/Developer

if [[ -d $DEVELOPER ]]; then
	cd $DEVELOPER
fi

# source aliases if found
ALIASES=~/.aliases

[ -f $ALIASES ] && source $ALIASES

# source fzf if found
FZF=~/.fzf.zsh

[ -f $FZF ] && source $FZF

# source zsh-autosuggestions if found
ZSH_AUTOSUGGESTIONS=~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f $ZSH_AUTOSUGGESTIONS ] && source $ZSH_AUTOSUGGESTIONS

# set rust in PATH if found
CARGO_BIN=~/.cargo/bin

if [[ -d $CARGO_BIN ]]; then
	export PATH=$CARGO_BIN:$PATH
fi

# set rbenv for ruby in PATH if found
RBENV_BIN=~/.rbenv/bin

if [[ -d $RBENV_BIN ]]; then
	export PATH=$RBENV_BIN:$PATH
	eval "$(rbenv init -)"
fi
