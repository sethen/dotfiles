#!/bin/zsh

header_message "running preferences for ${OS}"

if [[ ! -e "/var/lib/AccountsService/icons/${USER}" ]]; then
	information_message "copying avatar"

	sudo cp "${ZSH_DIRECTORY_PATH}/avatars/anime-sethen.png" "/var/lib/AccountsService/icons/${USER}"
	substitute_icon_name "/var/lib/AccountsService/icons/${USER}" /var/lib/AccountsService/users/${USER}
fi

substitute_icon_name "gnome-system-monitor" /var/lib/snapd/desktop/applications/gnome-system-monitor_gnome-system-monitor.desktop
substitute_icon_name "lastpass" $LOCAL_SHARE_APPLICATIONS/appimagekit-bitwarden.desktop
substitute_icon_name "thunderbird" $MAILSPRING

# arc menu preferences
dconf write /org/gnome/shell/extensions/arc-menu/menu-button-icon "'System_Icon'"
dconf write /org/gnome/shell/extensions/arc-menu/custom-menu-button-icon-size 10.0
dconf write /org/gnome/shell/extensions/arc-menu/enable-menu-button-arrow false

# date and time on top bar preferences
dconf write /org/gnome/desktop/calendar/show-weekdate true
dconf write /org/gnome/desktop/interface/clock-show-date true
dconf write /org/gnome/desktop/interface/clock-show-seconds true
dconf write /org/gnome/desktop/interface/clock-format "'12h'"
dconf write /org/gnome/desktop/datetime/automatic-timezone true
dconf write /org/gnome/desktop/interface/show-battery-percentage true
dconf write /org/gnome/settings-daemon/plugins/color/night-light-enabled true
dconf write /org/gnome/settings-daemon/plugins/color/night-light-schedule-automatic false
dconf write /org/gnome/settings-daemon/plugins/color/night-light-schedule-from 20.0
dconf write /org/gnome/settings-daemon/plugins/color/night-light-schedule-to 6.0

# dash to dock preferences
dconf write /org/gnome/shell/extensions/dash-to-dock/apply-custom-theme false
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-customize-running-dots true
dconf write /org/gnome/shell/extensions/dash-to-dock/background-opacity 0.4
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-background-color true
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'BOTTOM'"
dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size 48
dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'appimagekit-bitwarden.desktop', 'org.gnome.Calculator.desktop', 'gpick.desktop', 'org.gnome.Calendar.desktop', 'gparted.desktop', 'mailspring.desktop', 'telegramdesktop.desktop', 'org.gnome.Screenshot.desktop', 'firefox.desktop', 'google-chrome.desktop', 'spotify.desktop', 'gnome-system-monitor_gnome-system-monitor.desktop', 'org.gnome.Terminal.desktop', 'transmission-gtk.desktop', 'vlc.desktop', 'gnome-control-center.desktop']"
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height false
dconf write /org/gnome/shell/extensions/dash-to-dock/running-indicator-style "'DOTS'"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-show-apps-button false
dconf write /org/gnome/shell/extensions/dash-to-dock/transparency-mode "'FIXED'"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink true
dconf write /org/gnome/shell/extensions/dash-to-dock/require-pressure-to-show true
dconf write /org/gnome/shell/extensions/dash-to-dock/pressure-threshold 0.0
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed false
dconf write /org/gnome/shell/extensions/dash-to-dock/background-color "'#000000'"

# dynamic panel transparency preferences
dconf write /org/gnome/shell/extensions/dynamic-panel-transparency/enable-opacity true
dconf write /org/gnome/shell/extensions/dynamic-panel-transparency/remove-panel-styling true
dconf write /org/gnome/shell/extensions/dynamic-panel-transparency/maximized-opacity 204
dconf write /org/gnome/shell/extensions/dynamic-panel-transparency/unmaximized-opacity 204 

# extensions preferences
dconf write /org/gnome/shell/enabled-extensions "[ 'arc-menu@linxgem33.com', 'dash-to-dock@micxgx.gmail.com', 'openweather-extension@jenslody.de', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'desk-changer@eric.gach.gmail.com', 'dynamic-panel-transparency@rockon999.github.io' ]"

# desk changer preferences
dconf write /org/gnome/shell/extensions/desk-changer/profiles "{'default': [('file:///home/${USER}/Developer/wallpapers', true)]}"
dconf write /org/gnome/shell/extensions/desk-changer/rotation "'disabled'"

# desktop preferences
dconf write /org/gnome/desktop/screensaver/picture-uri "'file:////home/${USER}/Developer/wallpapers/earth/e4944k_4svi-buzz-andersen.jpg'"
dconf write /org/gnome/nautilus/desktop/trash-icon-visible false

# icon preferences
dconf write /org/gnome/nautilus/icon-view/default-zoom-level "'standard'"

# openweather preferences
dconf write /org/gnome/shell/extensions/openweather/city "'33.9550905,-83.3881868>Athens, Athens - Clarke County, Georgia, 30609, United States of America >-1'"
dconf write /org/gnome/shell/extensions/openweather/position-in-panel "'center'"

# terminal preferences
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/background-color "'rgb(38,50,56)'"
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/background-transparency-percent 0
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/font "'SFMono Nerd Font 14'"
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/palette "['rgb(38,50,56)', 'rgb(240,113,120)', 'rgb(195,232,141)', 'rgb(255,203,107)', 'rgb(130,170,255)', 'rgb(199,146,234)', 'rgb(137,221,255)', 'rgb(255,255,255)', 'rgb(46,60,67)', 'rgb(240,113,120)', 'rgb(195,232,141)', 'rgb(255,203,107)', 'rgb(130,170,255)', 'rgb(199,146,234)', 'rgb(137,221,255)', 'rgb(0,0,0)']"
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/use-system-font false
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/use-theme-colors false
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/use-theme-transparency false
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/use-transparent-background true

# theme preferences
dconf write /org/gnome/desktop/interface/gtk-theme "'Arc'"
dconf write /org/gnome/desktop/interface/icon-theme "'Moka'"
dconf write /org/gnome/desktop/interface/cursor-theme "'DMZ-Black'"
dconf write /org/gnome/shell/extensions/user-theme/name "'Arc-Dark'"
