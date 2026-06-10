#!/usr/bin/env fish

function authenticate-github
    running-message authenticate-github

    if test -e $HOME/.ssh/id_*.pub
        success-message "public key found"
    else
        information-message "no public key found, logging into github"

        gh auth login
    end
end
