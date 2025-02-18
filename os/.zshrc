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
if [[ -f $HOME_ALIASES_FILE ]]; then
    . $HOME_ALIASES_FILE
fi

if [[ -f $ZSH_AUTOSUGGESTIONS_FILE ]]; then
    . $ZSH_AUTOSUGGESTIONS_FILE
fi

# set initial directory
if [[ -d $DEVELOPER_DIRECTORY ]]; then
    cd $DEVELOPER_DIRECTORY
fi
