#!/usr/bin/env fish

function copy-noctalia-greeter-config
    running-message copy-noctalia-greeter-config

    # the greeter runs as its own user, which cannot read under the home
    # directory, so its config is copied rather than linked
    sudo install -o greeter -g greeter -m 644 $DOTFILES_DIRECTORY/noctalia/greeter.toml /var/lib/noctalia-greeter/greeter.toml
end
