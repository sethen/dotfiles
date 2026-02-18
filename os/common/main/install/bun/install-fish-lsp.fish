#!/usr/bin/env fish

function install-fish-lsp
    running-message install-fish-lsp

    if type -q fish-lsp
        success-message "fish-lsp installed"
    else
        information-message "installing fish-lsp"

        bun install -g fish-lsp
    end
end
