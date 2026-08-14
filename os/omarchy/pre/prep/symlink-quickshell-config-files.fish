#!/usr/bin/env fish

function symlink-quickshell-config-files
    running-message symlink-quickshell-config-files

    create-directory-if-not-exists $HOME_CONFIG_DIRECTORY/omarchy

    # replaces the waybar directory. omarchy 4 runs the bar, notifications and
    # panels inside one quickshell process; shell.json holds the widget layout
    # and the idle timings, and shell.toml overrides theme colors the way
    # waybar/style.css used to.
    #
    # heads up: `omarchy bar ...`, and dragging widgets on the bar itself, write
    # shell.json by renaming a temp file over it, which replaces this symlink
    # with a plain file. re-run this to relink, or just edit the repo copy — the
    # shell hot-reloads it on save.
    make-symlink $DOTFILES_DIRECTORY/quickshell/shell.json $HOME_CONFIG_DIRECTORY/omarchy/shell.json
    make-symlink $DOTFILES_DIRECTORY/quickshell/shell.toml $HOME_CONFIG_DIRECTORY/omarchy/shell.toml

    # custom bar modules, referenced from shell.json by id. omarchy resolves
    # `{ "id": "cpu", "type": "qml" }` to omarchy/bar/modules/cpu.qml.
    make-symlink $DOTFILES_DIRECTORY/quickshell/bar $HOME_CONFIG_DIRECTORY/omarchy/bar

    # The cloned widgets are not symlinked: regenerate-quickshell-plugins
    # builds them straight into ~/.config/omarchy/plugins, since every file
    # there is generated from the packaged source plus quickshell/patches.json.
end
