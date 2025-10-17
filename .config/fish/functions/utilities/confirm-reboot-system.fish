#!/bin/fish

function confirm-reboot-system
    while true
        read -l -P (set_color --bold yellow)"  do you want to reboot the system? [Yy/Nn]: "(set_color normal) answer

        switch $answer
            case y Y
                reboot-system
                break
            case n N
                break
            case '*'
                error-message "invalid input -- please enter Y/y or N/n"
        end
    end
end
