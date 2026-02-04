#!/usr/bin/env fish

function install-homebrew
    running-message install-homebrew

    if type -q brew
        success-message "homebrew already installed"
    else
        information-message "installing homebrew"

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    end
end
