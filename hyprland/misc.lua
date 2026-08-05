hl.config({
    misc = {    
        --vrr = 1

        -- animate_manual_resizes = false,
        -- animate_mouse_windowdragging = false,

        disable_hyprland_logo = true,
        force_default_wallpaper = 0,

        on_focus_under_fullscreen = 2,
        middle_click_paste = false,
        focus_on_activate = true,
        session_lock_xray = true,

        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,

        -- background_color = rgb($surfaceContainer),
    },

    debug = {
        error_position = 1
    }
})


-- Xwayland (saves a bit of RAM, might have to reenable)
hl.config({
    xwayland = {
        enabled = false
    }
})
