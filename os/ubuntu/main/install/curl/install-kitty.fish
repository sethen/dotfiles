#!/usr/bin/env fish

function install-kitty
    running-message install-kitty

    if type -q kitty
        success-message "kitty already installed"
    else
        information-message "installing kitty"

        # deliberately not apt. Ubuntu's kitty lags badly - the sessions config
        # here needs goto_session and active_session_name, which are recent - and
        # this setup depends on them. upstream's installer is the supported route
        # and drops a self-contained tree in ~/.local/kitty.app, no root needed.
        curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

        # the installer does not touch PATH or the desktop database itself
        make-symlink $HOME/.local/kitty.app/bin/kitty $HOME/.local/bin/kitty
        make-symlink $HOME/.local/kitty.app/bin/kitten $HOME/.local/bin/kitten

        create-directory-if-not-exists $HOME/.local/share/applications
        cp $HOME/.local/kitty.app/share/applications/kitty.desktop $HOME/.local/share/applications/
        sed -i "s|Icon=kitty|Icon=$HOME/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" \
            $HOME/.local/share/applications/kitty.desktop
        sed -i "s|Exec=kitty|Exec=$HOME/.local/kitty.app/bin/kitty|g" \
            $HOME/.local/share/applications/kitty.desktop
    end
end
