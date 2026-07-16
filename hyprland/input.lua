hl.config({
    input = {
        kb_layout  = "de",
        numlock_by_default = false,
        repeat_delay = 250,
        repeat_rate = 35,

        focus_on_close = 2,
        follow_mouse = 1,

        sensitivity = 0, -- -1.0 to 1.0

        touchpad = {
            natural_scroll = true,
            disable_while_typing = VtouchpadDisableTyping,
            scroll_factor = VtouchpadScrollFactor
        },
    },

    binds = {
        scroll_event_delay = 0
    },

    cursor = {
        persistent_warps = true,
        warp_on_change_workspace = 1,
        hide_on_key_press = true
    }
})