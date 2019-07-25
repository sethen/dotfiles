fpath=( ~/.zsh/functions "${fpath[@]}" )

autoload -Uz compinit && compinit
autoload -Uz error_message
autoload -Uz git_branch_name
autoload -Uz git_modified_files_count
autoload -Uz git_sha
autoload -Uz git_staged_files_count
autoload -Uz git_untracked_files_count
autoload -Uz header_message
autoload -Uz information_message
autoload -Uz prompt_info
autoload -Uz rprompt_info
autoload -Uz success_message
