#!/usr/bin/env fish

function run-darwin-main
    running-message run-darwin-main

    ## install
    #-> homebrew
    install-homebrew
    #-> brew
    install-brave-browser
    install-font-jetbrains-mono
    install-fortune
    install-git
    install-gnupg
    install-nginx
    install-spotify
    install-virtualbox
    install-wezterm
end
