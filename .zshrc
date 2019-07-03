for local_function_file in ~/.zsh/functions/local/*; do
	source $local_function_file
done

source ~/.aliases

export CARGO_PATH=~/.cargo/bin
export GOPATH=$HOME/Developer/go
export NPM_GLOBAL_PATH=~/.npm-global/bin
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src
export PATH=$CARGO_PATH:$NPM_GLOBAL_PATH:$GOPATH/bin:$PATH

PROMPT='$(prompt_info)'
RPROMPT='$(rprompt_info)'

HISTFILE=~/.zsh_history
SAVEHIST=1000

setopt AUTOCD
setopt CORRECT
setopt NO_BEEP
setopt PROMPT_SUBST

cd ~/Developer

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
