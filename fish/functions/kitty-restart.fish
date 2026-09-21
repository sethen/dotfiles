#!/usr/bin/env fish

function kitty-restart
    running-message kitty-restart

    # kitty has no server that outlives the GUI, so killing it is the whole job:
    # the sessions are rebuilt from kitty/sessions/*.kitty-session the next time
    # one is opened.
    #
    # the flip side is that this really does end those processes. kitty has no
    # detach, so nothing survives it.
    pkill -x kitty

    information-message "sessions rebuild on the next terminal you open"
end
