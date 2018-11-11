for local_function_file in ~/.zsh/functions/local/*; do
	source $local_function_file
done

source ~/.aliases

export GOPATH=$HOME/Developer/go
export PATH=~/.npm-global/bin:$GOPATH/bin:$PATH

PROMPT_INFO=$(prompt_info)
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