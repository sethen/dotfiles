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
[ -f $HOME_ALIASES_FILE ] && . $HOME_ALIASES_FILE
[ -f $ZSH_AUTOSUGGESTIONS_FILE ] && . $ZSH_AUTOSUGGESTIONS_FILE

# set initial directory
[ -d $DEVELOPER_DIRECTORY ] && cd $DEVELOPER_DIRECTORY
