# the status bar: mode badge on the left, tab list centered, session on the
# right, bar pinned to the bottom. colours are the UI_* constants below.
#
# the centring is done here rather than with kitty's `tab_bar_align center`, and
# that is not a preference. kitty centres in align_with_factor(), which runs after
# every tab is drawn: it reads the end of the last tab extent and shifts the whole
# line right with insert_characters(). Two things break against a right-pinned
# badge. The shift would carry the badge off the right edge with everything else,
# and the guard `end < columns - 1` is already false because drawing the badge
# leaves the cursor near the last column, so it never fires at all. So the config
# sets tab_bar_align start and the offset is applied below instead.
#
# kitty lays the bar out in two passes. The first has extra_data.for_layout set and
# resets the cursor to 0 before every tab, purely to measure; the second draws for
# real, left to right. So the widths are accumulated on the first pass and the
# offset applied at the start of the second.
#
# the glyphs live in U+F000-U+F1B2, the range kitty.conf reserves for
# SethensSuperCode via symbol_map. written as escapes rather than literal
# private-use characters so an editor or a copy-paste cannot mangle them.

from kitty.boss import get_boss
from kitty.fast_data_types import Screen
from kitty.tab_bar import DrawData, ExtraData, TabBarData, as_rgb, draw_title

# palette
UI_BG      = 0x181825
UI_DIM     = 0x6c7086
UI_NORMAL  = 0x89b4fa
UI_SCROLL  = 0xeba0ac
UI_SESSION = 0x94e2d5

# lower-left triangle, fading a badge into the bar, and its mirror for the other end
SEPARATOR_RIGHT = ""
SEPARATOR_LEFT = ""

ZOOM_INDICATOR = "  "
WORKSPACE_ICON = ""
SCROLL_ICON = ""

# per OS window, so two windows with different tab counts do not centre each other.
# _running accumulates during the measuring pass; _total is what the draw pass reads.
_running: dict[int, int] = {}
_total: dict[int, int] = {}


def _paint(screen: Screen, fg: int, bg: int, bold: bool = False) -> None:
    screen.cursor.fg = as_rgb(fg)
    screen.cursor.bg = as_rgb(bg)
    screen.cursor.bold = bold


def _overlay_active() -> bool:
    """True while the scrollback pager or a kitten overlay is up.

    OverlayType is only transient/main, so the pager and the search kitten are
    indistinguishable from here. One SCROLL badge covers both rather than
    inventing a distinction the terminal cannot actually report.
    """
    try:
        window = get_boss().active_window
        return window is not None and window.overlay_window is not None
    except Exception:
        return False


def _draw_mode_badge(screen: Screen) -> None:
    # drawn at column 0, in the gap the centring offset leaves free. if the tabs
    # are wide enough that there is no gap, the badge would collide with the first
    # tab, so it is skipped rather than drawn over it.
    if not _overlay_active() or screen.cursor.x == 0:
        return

    x = screen.cursor.x
    badge = f" {SCROLL_ICON}  SCROLL "

    if len(badge) + len(SEPARATOR_RIGHT) > x:
        return

    screen.cursor.x = 0
    _paint(screen, UI_BG, UI_SCROLL, bold=True)
    screen.draw(badge)
    _paint(screen, UI_SCROLL, UI_BG)
    screen.draw(SEPARATOR_RIGHT)

    screen.cursor.bold = False
    screen.cursor.x = x


def _draw_session_badge(screen: Screen, tab: TabBarData) -> None:
    # the session badge: which workspace this window belongs to. kitty hands it
    # to the tab bar directly as active_session_name.
    name = tab.active_session_name or tab.session_name or ""

    if not name:
        return

    label = f" {WORKSPACE_ICON}  {name} "
    width = len(label) + len(SEPARATOR_LEFT)
    start = screen.columns - width

    # never overwrite the tabs; if the bar is too narrow the badge just drops
    if start <= screen.cursor.x:
        return

    screen.cursor.x = start
    _paint(screen, UI_SESSION, UI_BG)
    screen.draw(SEPARATOR_LEFT)
    _paint(screen, UI_BG, UI_SESSION, bold=True)
    screen.draw(label)
    screen.cursor.bold = False


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_tab_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    osw = draw_data.os_window_id

    if extra_data.for_layout and index == 1:
        _running[osw] = 0

    if not extra_data.for_layout and index == 1:
        # the measuring pass runs unconstrained, so a total wider than the bar means
        # the draw pass is going to truncate; there is no gap to centre into then
        # and the offset falls back to 0.
        offset = (screen.columns - _total.get(osw, 0)) // 2
        if offset > 0:
            screen.cursor.x = offset

    start = screen.cursor.x

    active = tab.is_active
    _paint(screen, UI_NORMAL if active else UI_DIM, UI_BG, bold=active)

    screen.draw(" ")
    draw_title(draw_data, screen, tab, index, max_tab_length - 2)

    # stack is kitty's zoom: ctrl+shift+z in kitty.conf toggles into it, and it is
    # which is what this glyph marks.
    screen.draw(ZOOM_INDICATOR if tab.layout_name == "stack" else " ")
    screen.cursor.bold = False

    # the end of the tab itself. captured before the badges move the cursor, so the
    # TabExtent kitty builds from this return value still matches what is clickable.
    end = screen.cursor.x

    if extra_data.for_layout:
        _running[osw] = _running.get(osw, 0) + (end - start)
        if is_last:
            _total[osw] = _running[osw]
        return end

    if index == 1:
        _draw_mode_badge(screen)

    if is_last:
        _draw_session_badge(screen, tab)

    return end
