#!/usr/bin/env fish

function configure-git-identity
    set -l git_config_local $HOME/.gitconfig.local

    # already written; git reads it via the [include] in the committed .gitconfig
    if test -f $git_config_local
        return
    end

    set -l git_name (prompt-value "your git commit name" "" "e.g. Ada Lovelace")
    set -l git_email (prompt-value "your git commit email" "" "e.g. ada@example.com")
    set -l github_user (prompt-value "your github username" "" "e.g. adalovelace")

    printf '[user]\n\tname = %s\n\temail = %s\n[github]\n\tuser = %s\n' \
        "$git_name" "$git_email" "$github_user" >$git_config_local

    success-message "wrote git identity to $git_config_local"
end
