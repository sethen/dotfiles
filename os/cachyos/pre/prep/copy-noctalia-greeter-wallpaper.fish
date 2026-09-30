#!/usr/bin/env fish

function copy-noctalia-greeter-wallpaper
    running-message copy-noctalia-greeter-wallpaper

    set -l wallpaper $DEVELOPER_DIRECTORY/wallpapers/kelly-doroteo-KNohnzKmLTY-unsplash.jpg

    # the wallpapers repo is cloned later in the run, so a first run skips this
    if not test -f $wallpaper
        error-message "$wallpaper not found, rerun once the wallpapers repo is cloned"

        return 1
    end

    # copied for the same reason as greeter.toml: the greeter cannot read under
    # the home directory
    sudo install -o greeter -g greeter -m 644 $wallpaper /var/lib/noctalia-greeter/wallpaper.jpg
end
