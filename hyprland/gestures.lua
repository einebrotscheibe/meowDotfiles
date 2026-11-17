hl.config({
    gestures = {
        workspace_swipe_distance = 500,
        workspace_swipe_cancel_ratio = 0.15,
        workspace_swipe_min_speed_to_force = 5,
        workspace_swipe_direction_lock = false,
        -- workspace_swipe_direction_lock_threshold = 10
        workspace_swipe_create_new = true,
        workspace_swipe_use_r = true
    }
})

hl.gesture({
    fingers = VworkspaceSwipeFingers,
    direction = "horizontal",
    action = "workspace"
})

-- special workspaces on vertical swipes:
--   up   -> show "special"  | down -> hide "special"
--   down -> show "music"    | up   -> hide "music"
-- `shown` is the special workspace to open from a normal workspace,
-- `hidden` is the one this direction closes again.
local special_swipe = function(shown, hidden)
    return function()
        -- ask the monitor which special workspace is open (nil if none);
        -- don't rely on the focused window, it can be nil or elsewhere
        local special = hl.get_active_special_workspace()
        if not special then
            hl.dispatch(hl.dsp.workspace.toggle_special(shown))
        elseif special.name == "special:" .. hidden then
            hl.dispatch(hl.dsp.workspace.toggle_special(hidden))
        end
        -- any other case (e.g. swiping down while "special" is already open) does nothing
    end
end

hl.gesture({
    fingers = VgestureFingers,
    direction = "down",
    action = special_swipe("special", "music")
})

hl.gesture({
    fingers = VgestureFingers,
    direction = "up",
    action = special_swipe("music", "special")
})

-- adjusting volume
local volume_gesture = function(change) hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ " .. math.abs(change) .. "%" .. (change<0 and "-" or "+")) end
hl.gesture({
    fingers = VgestureFingersMore,
    direction = "vertical",
    action = {
        start = function(dataTable) volume_gesture(-0.25 * dataTable.delta.y) end,
        update = function(dataTable) volume_gesture(-0.25 * dataTable.delta.y) end
    }
})
