# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import hook
from datetime import datetime as dt
import os
import subprocess


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])
        
# Add th, nd or st to the date - use custom_date in text box
def suffix(d):
    return 'th' if 11<=d<=13 else {1:'st',2:'nd',3:'rd'}.get(d%10, 'th')

def custom_strftime(format, t):
    return t.strftime(format).replace('{S}', str(t.day) + suffix(t.day))

def custom_date():
	return custom_strftime('%A, {S} %B', dt.now())

mod = "mod4"

terminal = 'kitty'
home = os.path.expanduser('~')

MYCOLORS = [
    '#073642',
    '#dc322f',
    '#00ff2a',
    '#b58900',
    '#268bd2',
    '#d33682',
    '#2aa198',
    '#eee8d5'
]

BLACK = MYCOLORS[0]
RED = MYCOLORS[1]
GREEN = MYCOLORS[2]
YELLOW = MYCOLORS[3]
BLUE = MYCOLORS[4]
MAGENTA = MYCOLORS[5]
CYAN = MYCOLORS[6]
WHITE = MYCOLORS[7]

keys = [

    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down(),
        desc="Move focus down in stack pane"),
    Key([mod], "j", lazy.layout.up(),
        desc="Move focus up in stack pane"),
        
    #Key([mod], "h", lazy.layout.left()),
	#Key([mod], "l", lazy.layout.right()),
	Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
	Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
	Key([mod, "mod1"], "j", lazy.layout.flip_down()),
	Key([mod, "mod1"], "k", lazy.layout.flip_up()),
	Key([mod, "mod1"], "h", lazy.layout.flip_left()),
	Key([mod, "mod1"], "l", lazy.layout.flip_right()),
	Key([mod, "control"], "j", lazy.layout.grow_down()),
	Key([mod, "control"], "k", lazy.layout.grow_up()),
	Key([mod, "control"], "h", lazy.layout.grow_left()),
	Key([mod, "control"], "l", lazy.layout.grow_right()),
	Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "m",
             lazy.layout.maximize(),
             desc='toggle window between minimum and maximum sizes'
             ), 
	Key([mod], "h",
             lazy.layout.grow(),
             lazy.layout.increase_nmaster(),
             desc='Expand window (MonadTall), increase number in master pane (Tile)'
             ),
         Key([mod], "l",
             lazy.layout.shrink(),
             lazy.layout.decrease_nmaster(),
             desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
             ),

    # Move windows up or down in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),
    Key([mod, "control"], "j", lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate(),
        desc="Swap panes of split stack"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    # Qtile system keys
    Key([mod, "control"], "l", lazy.spawn("dm-tool lock")),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod, "control"], "p", lazy.spawn("rofi -show p -modi p:"+home+"/.local/bin/rofi-power-menu -width 20 -lines 6")),
        
    # Rofi
    Key(["control"], "space", lazy.spawn("rofi -show drun")),
        
    # ------------ Hardware Configs ------------
    # Volume
    Key([], "XF86AudioMute", lazy.spawn(home + "/.local/bin/volumecontrol mute")),
    Key([], "XF86AudioLowerVolume", lazy.spawn(home + "/.local/bin/volumecontrol down")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(home + "/.local/bin/volumecontrol up")),
    
    # Brightness
    Key([], "F2", lazy.spawn(home + "/.local/bin/brightnesscontrol down")),
    Key([], "F3", lazy.spawn(home + "/.local/bin/brightnesscontrol up")),
    
    # Screenshot
    # Save screen to clipboard
    Key([], "Print", lazy.spawn("/usr/bin/escrotum -C")),
    # Save screen to screenshots folder
	Key([mod], "Print", lazy.spawn("/usr/bin/escrotum " + home + "/Pictures/Screenshots/screenshot_%d_%m_%Y_%H_%M_%S.png")),
	# Capture region of screen to clipboard
	Key([mod, "shift"], "s", lazy.spawn("/usr/bin/escrotum -Cs")),
]

# Groups

groups = [Group(i) for i in "1234"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])
    
##### DEFAULT THEME SETTINGS FOR LAYOUTS #####
layout_theme = {"border_width": 3,
                "margin": 16,
                "border_focus": BLUE,
                "border_normal": BLACK
                }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Stack(num_stacks=2, **layout_theme),
    #layout.Max(),
    # Try more layouts by unleashing below layouts.
     layout.Bsp(**layout_theme),
    # layout.Columns(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='Hack Nerd Font Mono',
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(length = 10),
                widget.CurrentLayoutIcon(scale = 0.7),
                widget.CurrentLayout(**widget_defaults),
                widget.GroupBox(**widget_defaults),
                widget.Prompt(**widget_defaults),
                #widget.TaskList(margin = 2, highlight_method = 'block', **widget_defaults),
                widget.Spacer(),
                widget.CheckUpdates(
                       **widget_defaults,
                       update_interval = 1800,
                       distro = 'Arch_yay',
                       custom_command = 'checkupdates+aur',
                       display_format = ' {updates}',
                       colour_have_updates=GREEN,
                       execute = 'kitty -e yay -Syu',
                       ),
                widget.BatteryIcon(
                       ),
                widget.Battery(charge_char='+', discharge_char='', unknown_char='', format='{char}{percent:2.0%}', **widget_defaults),
                widget.Volume(emoji = True),
                widget.Volume(**widget_defaults),
                widget.Systray(),
                widget.Spacer(length = 10),
                widget.GenPollText(func=custom_date, update_interval=1, **widget_defaults),
                widget.Clock(
					**widget_defaults,
					format='%H:%M'
					),
				widget.Spacer(length = 10),
            ],
            24, margin=[10, 16, 0, 16] # N E S W
        ),
    ),
]



# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    Match(title='Quit and close tabs?'),
    Match(wm_type='utility'),
    Match(wm_type='notification'),
    Match(wm_type='toolbar'),
    Match(wm_type='splash'),
    Match(wm_type='dialog'),
    Match(wm_class='Conky'),
    Match(wm_class='Firefox'),
    Match(wm_class='file_progress'),
    Match(wm_class='confirm'),
    Match(wm_class='dialog'),
    Match(wm_class='download'),
    Match(wm_class='error'),
    Match(wm_class='notification'),
    Match(wm_class='splash'),
    Match(wm_class='toolbar'),
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qtile"

# assignments = {}
# assignments["1"] = ["Navigator", "geany"]
# assignments["2"] = ["", ""]
# assignments["3"] = ["", ""]
# assignments["4"] = ["telegram-desktop", ""]
# @hook.subscribe.client_new
# def assign_app_group(client):
    # wm_class = client.window.get_wm_class()[0]
    # for i in list(assignments.keys()):
        # if wm_class in assignments[i]:
            # client.togroup(i, switch_group=True)
