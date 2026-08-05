-- Global Rules
hl.window_rule({
    match = { fullscreen = false },
    opacity = VwindowOpacity .. " override"
})

hl.window_rule({
    match = { class = "foot|equibop|org\\.quickshell|imv|swappy" },
    opaque = true
})

hl.window_rule({
    match = { float = true, xwayland = false },
    center = true
})

-- floating for gifs
hl.window_rule({
    match = { class = "mpv" },
    float = true,
})

-- Float Utilities (Grouped in a loop to keep your config uncluttered)
local float_classes = {
    "guifetch", "yad", "zenity", "wev", "org\\.gnome\\.FileRoller", 
    "file-roller", "blueman-manager", "com\\.github\\.GradienceTeam\\.Gradience", 
    "feh", "imv", "system-config-printer", "org\\.quickshell"
}
for _, class_name in ipairs(float_classes) do
    hl.window_rule({ match = { class = class_name }, float = true })
end

-- Float, Resize and Center Blocks
hl.window_rule({
    match = { class = "foot", title = "nmtui" },
    float = true,
    size = { "60%", "70%" },
    center = true
})

hl.window_rule({
    match = { class = "org\\.gnome\\.Settings" },
    float = true,
    size = { "70%", "80%" },
    center = true
})

hl.window_rule({
    match = { class = "org\\.pulseaudio\\.pavucontrol|yad-icon-browser" },
    float = true,
    size = { "60%", "70%" },
    center = true
})

hl.window_rule({
    match = { class = "nwg-look" },
    float = true,
    size = { "50%", "60%" },
    center = true
})

-- Special Workspaces
hl.window_rule({
    match = { class = "btop|btop-sysmon" },
    workspace = "special:sysmon"
})

hl.window_rule({
    match = { class = "Spotify( Free)?|spotify|spotify_player" },
    workspace = "special:music"
})

hl.window_rule({
    match = { class = "discord|equibop|vesktop|whatsapp" },
    workspace = "special:communication"
})

hl.window_rule({
    match = { class = "Todoist" },
    workspace = "special:todo"
})

-- Dialogs (Handled via loop for scannability)
local dialog_titles = {
    "(Select|Open)( a)? (File|Folder)(s)?",
    "File (Operation|Upload)( Progress)?",
    ".* Properties",
    "Export Image as PNG",
    "GIMP Crash Debug",
    "Save As",
    "Library"
}
for _, title_name in ipairs(dialog_titles) do
    hl.window_rule({ match = { title = title_name }, float = true })
end

-- Picture in Picture
hl.window_rule({
    match = { title = "Picture(-| )in(-| )[Pp]icture" },
    move = "100%-w-2% 100%-w-3%",
    keep_aspect_ratio = true,
    float = true,
    pin = true
})

-- Creative Software
hl.window_rule({
    match = { class = "krita|gimp|inkscape|darktable|resolve|kdenlive|shotcut|blender|godot" },
    opaque = true
})

-- Ueberzugpp
hl.window_rule({
    match = { class = "^(ueberzugpp_.*)$" },
    float = true,
    no_initial_focus = true
})

-- Steam
hl.window_rule({
    match = { class = "steam" },
    rounding = 10
})

hl.window_rule({
    match = { class = "steam", title = "Friends List" },
    float = true
})

-- Games (Steam, Lutris/Wine, Gamescope)
hl.window_rule({
    match = { class = "(steam_app_(default|[0-9]+))|gamescope" },
    opaque = true,
    immediate = true,
    idle_inhibit = "always"
})

-- Minecraft Launcher Consoles
hl.window_rule({
    match = { class = "com-atlauncher-App", title = "ATLauncher Console" },
    float = true
})

hl.window_rule({
    match = { class = "PandoraLauncher", title = "Minecraft Game Output" },
    float = true
})

-- Autodesk Fusion 360
hl.window_rule({
    match = { class = "fusion360\\.exe", title = "Fusion360|(Marking Menu)" },
    no_blur = true
})

-- XWayland Popups
hl.window_rule({
    match = { xwayland = true, title = "win[0-9]+" },
    no_dim = true,
    no_shadow = true,
    rounding = 10
})

-- workspace rules
hl.workspace_rule({
    workspace = "w[tv1]s[false]",
    gaps_out = VsingleWindowGapsOut
})

hl.workspace_rule({
    workspace = "f[1]s[false]",
    gaps_out = VsingleWindowGapsOut
})

-- layer rules
-- Animations
hl.layer_rule({ match = { namespace = "hyprpicker" }, animation = "fade" })
hl.layer_rule({ match = { namespace = "logout_dialog" }, animation = "fade" })
hl.layer_rule({ match = { namespace = "selection" }, animation = "fade" })
hl.layer_rule({ match = { namespace = "wayfreeze" }, animation = "fade" })

-- Fuzzel Launcher
hl.layer_rule({
    match = { namespace = "launcher" },
    animation = "popin 80%",
    blur = true
})

-- Caelestia Shell
hl.layer_rule({
    match = { namespace = "caelestia-(border-exclusion|area-picker)" },
    no_anim = true
})

hl.layer_rule({
    match = { namespace = "caelestia-(drawers|background)" },
    animation = "fade"
})

hl.layer_rule({
    match = { namespace = "caelestia-drawers" },
    blur = true,
    ignore_alpha = 0.57
})
