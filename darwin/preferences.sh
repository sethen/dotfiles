#!/bin/zsh

header_message "running preferences for ${DISTRO}"

information_message 'removing all dock icons'

dockutil --remove all

information_message 'adding dock icons'

dockutil --add '/Applications/App Store.app/' --position 1
dockutil --add '/Applications/Bitwarden.app/' --after 'App Store'
dockutil --add '/Applications/Calculator.app/' --after 'Bitwarden'
dockutil --add '/Applications/Calendar.app/' --after 'Calculator'
dockutil --add '/Applications/Dictionary.app/' --after 'Calendar'
dockutil --add '/Applications/Mail.app/' --after 'Dictionary'
dockutil --add '/Applications/Messages.app/' --after 'Mail'
dockutil --add '/Applications/iTunes.app/' --after 'Messages'
dockutil --add '/Applications/Spotify.app/' --after 'iTunes'
dockutil --add '/Applications/iTerm.app/' --after 'Spotify'
dockutil --add '/Applications/Google Chrome.app/' --after 'iTerm'
dockutil --add '/Applications/Safari.app/' --after 'Google Chrome'
dockutil --add '~/Developer' --display folder --view list
dockutil --add '~/Downloads' --display folder --view list
