#!/usr/bin/env fish

function wezterm-restart
    running-message wezterm-restart

    # killing the gui is not enough on its own. the layout lives in
    # wezterm-mux-server, and wezterm/lua/workspaces.lua builds it from mux-startup,
    # which only fires when that server starts. leave the server up and the next
    # window reattaches to exactly the same tabs, including whatever you just closed.
    pkill -x wezterm-gui

    sleep 1

    # not a typo: -x matches /proc/comm, which linux caps at 15 characters, so
    # the real name there is `wezterm-mux-ser`. spelling it out in full matches
    # nothing at all (pkill even says so: "pattern that searches for process
    # name longer than 15 characters will result in zero matches"), which would
    # leave the mux up and the layout unrebuilt with no error
    pkill -x wezterm-mux-ser

    sleep 1

    # stale sockets from a killed gui make the next `wezterm connect` fail with
    # "failed to connect ... terminating" rather than starting a fresh server.
    #
    # find rather than a glob: by the time this runs the sockets are usually already
    # gone, and fish reports an unmatched wildcard as an error rather than expanding
    # it to nothing.
    find $XDG_RUNTIME_DIR/wezterm -maxdepth 1 \
        \( -name 'gui-sock-*' -o -name 'wayland-*' -o -name sock -o -name pid \) \
        -delete 2>/dev/null

    information-message "layout will rebuild on the next terminal you open"
end
