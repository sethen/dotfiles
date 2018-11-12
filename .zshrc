for local_function_file in ~/.zsh/functions/local/*; do
	source $local_function_file
done

source ~/.aliases

export GOPATH=$HOME/Developer/go
export PATH=~/.npm-global/bin:$GOPATH/bin:$PATH

PROMPT='$(prompt_info)'
RPROMPT='$(rprompt_info)'

HISTFILE=~/.zsh_history
SAVEHIST=1000

setopt AUTOCD
setopt CORRECT
setopt NO_BEEP
setopt PROMPT_SUBST

cd ~/Developer