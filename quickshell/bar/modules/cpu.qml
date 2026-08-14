// waybar had a `cpu` module that never showed a number — it was a static glyph
// whose only job was launching btop, plus a hover tooltip with live activity.
// omarchy 4 ships no cpu widget, so this is that button rebuilt as a custom QML
// module. shell.json refers to it as { "id": "cpu", "type": "qml" }, which
// resolves to this path.
//
// The glyph is drawn in plain QtQuick rather than the bar's own Ui components:
// BarIconButton, Style and Color live under the packaged shell's import path
// and do not resolve from a user module loaded out of tree. The injected `bar`
// object is the supported way to reach theme colors and the current font.

import QtQuick
import Quickshell.Io

Item {
  id: root

  // filled in by the bar after loading
  property var bar
  property string moduleName
  property var settings

  // Sampled from /proc/stat; empty until the first reading lands.
  property string usage: ""
  property string loadAvg: ""
  property string topProcs: ""

  // bar.showTooltip() silently drops any request whose target does not
  // expose tooltipHovered === true (Bar.qml targetTooltipHovered). Custom
  // modules have to declare it themselves; WidgetButton does the same.
  readonly property bool tooltipHovered: visible && mouse.containsMouse

  readonly property string tooltip: usage === ""
    ? "System monitor"
    : "CPU " + usage + "%"
      + (loadAvg ? "\nload " + loadAvg : "")
      + (topProcs ? "\n\n" + topProcs : "")

  implicitWidth: 28
  implicitHeight: bar ? bar.barSize : 26

  Text {
    id: glyph
    anchors.centerIn: parent

    // lucide cpu, matching the rest of the bar.
    text: ""

    color: bar ? bar.foreground : "white"
    font.family: "SethensSuperCode"
    font.pixelSize: 14
  }

  // Two /proc/stat readings a moment apart give a real utilisation figure;
  // a single reading only describes the whole uptime and barely moves.
  Process {
    id: probe
    command: ["bash", "-c", `
      read -r _ a b c d _ < /proc/stat; t1=$((a+b+c+d)); i1=$d
      sleep 0.25
      read -r _ a b c d _ < /proc/stat; t2=$((a+b+c+d)); i2=$d
      dt=$((t2-t1)); di=$((i2-i1))
      if [ "$dt" -gt 0 ]; then echo $(( (100*(dt-di))/dt )); else echo 0; fi
      cut -d' ' -f1-3 /proc/loadavg
      ps -eo comm,pcpu --sort=-pcpu --no-headers 2>/dev/null | head -4 \
        | awk '{ printf "%-14s %5.1f%%\\n", $1, $2 }'
    `]
    stdout: StdioCollector {
      waitForEnd: true
      onStreamFinished: {
        var lines = String(text || "").split("\n").filter(l => l.length > 0)
        if (lines.length < 1) return
        root.usage = lines[0].trim()
        root.loadAvg = lines.length > 1 ? lines[1].trim() : ""
        root.topProcs = lines.slice(2).join("\n")
        // Refresh the tooltip in place if it is already on screen.
        if (mouse.containsMouse && root.bar) root.bar.showTooltip(root, root.tooltip)
      }
    }
  }

  Timer {
    interval: 3000
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: if (!probe.running) probe.running = true
  }

  MouseArea {
    id: mouse
    anchors.fill: parent
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    hoverEnabled: true

    onEntered: if (bar) bar.showTooltip(root, root.tooltip)
    onExited: if (bar) bar.hideTooltip(root)

    onClicked: function (mouse) {
      if (!bar) return

      if (mouse.button === Qt.RightButton) {
        // waybar hardcoded alacritty here. going through omarchy-launch-terminal
        // keeps it on whatever xdg-terminals.list names, which is wezterm.
        bar.run("omarchy-launch-terminal")
      } else {
        bar.run("omarchy-launch-or-focus-tui btop")
      }
    }
  }
}
