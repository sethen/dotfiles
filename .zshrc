source ~/.aliases

export GOPATH=$HOME/Developer/go
export PATH=~/.npm-global/bin:$GOPATH/bin:$PATH

PROMPT_INFO=$(echo "%F{6}%n%f:%F{2}%m%f in %F{3}%~%f ")
RPROMPT_INFO=$(echo "%F{5}@%D{%L:%M:%S}%f")

PROMPT="${PROMPT_INFO}"
RPROMPT="${RPROMPT_INFO}"

HISTFILE=~/.zsh_history
SAVEHIST=1000

setopt AUTOCD
setopt CORRECT
setopt NO_BEEP
setopt PROMPT_SUBST

cd ~/Developer
