#!/usr/bin/env fish

function run-darwin-pre
    running-message run-darwin-pre

    # prep
    copy-fonts
    touch-hushlogin

    # install
    install-homebrew
    install-gh
end
