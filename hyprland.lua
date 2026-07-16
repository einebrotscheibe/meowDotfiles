-- hardcoded weil wtf?
Vhypr = "/home/meow/.config/hypr"
Vhl = Vhypr .. "/hyprland"
VhScheme = Vhypr .. "/scheme"
VcConf = "~/.config/caelestia"

-- default monitor conf
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1
})

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
require("hyprland.rules")
require("hyprland.scrolling")
require("scheme.current")