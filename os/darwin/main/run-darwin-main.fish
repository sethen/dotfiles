#!/usr/bin/env fish

function run-darwin-setup
    running-message run-darwin-setup

    ## install
    #-> homebrew
    install-homebrew
    #-> brew
    install-brave-browser
    install-ghostty
    install-git
    install-gnupg
    install-libyaml
    install-nginx
    install-spotify
    install-virtualbox
end
