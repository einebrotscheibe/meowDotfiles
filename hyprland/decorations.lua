local scheme = dofile(VhScheme .. "/current.lua")

hl.config({
    decoration = {
        rounding = VwindowRounding,

        blur = {
            enabled = VblurEnabled,
            xray = VblurXray,
            special = VblurSpecialWs,
            ignore_opacity = true,
            new_optimizations = true,
            popups = VblurPopups,
            size = VblurSize,
            passes = VblurPasses,
        },

        shadow = {
            enabled = VshadowEnabled,
            range = VshadowRange,
            render_power = VshadowRenderPower,
            color = "rgba(" .. (scheme.surface or "ff0000") .. "ee)",
        }
    }
})