hl.on("hyprland.start", function ()
    --keyring and authentication
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    
    --clipboard history
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    --auto delete trash after 30 days
    hl.exec_cmd("trash-empty 30")

    --cursor
    hl.exec_cmd("hyprctl setcursor" .. VcursorTheme .. VcursorSize)
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme" .. VcursorTheme)
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size" .. VcursorSize)
    
    --night light
    hl.exec_cmd("gammastep")

    --forward bluetooth media commands to MPRIS
    hl.exec_cmd("mpris-proxy")

    --resize and move windows based on matches (e.g. pip)
    hl.exec_cmd("caelestia resizer -d")

    --start shell
    hl.exec_cmd("caelestia shell -d")
end)