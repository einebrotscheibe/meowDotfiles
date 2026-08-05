local scheme = dofile(VPhScheme .. "/current.lua")

hl.config({
    general = {
        layout = "dwindle",

        allow_tearing = false,

        gaps_workspaces = VworkspaceGaps,
        gaps_in = VwindowGapsIn,
        gaps_out = VwindowGapsOut,
        border_size = VwindowBorderSize,

        col = {
            active_border = "rgba(" .. (scheme.primary or "ff0000") .. "ee)",
            inactive_border = "rgba(" .. (scheme.onSurfaceVariant or "ff0000") .. "ee)"
        }
    },

    dwindle = {
        preserve_split = true,
        smart_split = false,
        smart_resizing = true,
    }
})
