-- os.getenv("XDG_CONFIG_HOME") .. 
VPhome = "/home/meow"
VPhypr = VPhome .. "/.config/hypr"
VPhl = VPhypr .. "/hyprland"
VPhScheme = VPhypr .. "/scheme"

-- configs
require("variables")
require("hyprland.animations")
require("hyprland.decorations")
require("hyprland.env")
require("hyprland.execs")
require("hyprland.general")
require("hyprland.gestures")
require("hyprland.input")
require("hyprland.keybinds")
require("hyprland.misc")
require("hyprland.monitor")
require("hyprland.rules")
require("hyprland.scrolling")
require("scheme.current")