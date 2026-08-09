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

hl.gesture({
    fingers = VgestureFingers,
    direction = "down",
    action = function ()
        local win = hl.get_active_window()
        if win.workspace.id < 0 then
            if win.workspace.name:match("special:special") then
                hl.dispatch(hl.dsp.workspace.toggle_special("special"))
            else
                hl.dispatch(hl.dsp.workspace.toggle_special("music"))
            end
        else 
            hl.dispatch(hl.dsp.workspace.toggle_special("special"))
        end
    end
})

hl.gesture({
    fingers = VgestureFingers,
    direction = "up",
    action = function ()
        local win = hl.get_active_window()
        if win.workspace.id < 0 then
            if win.workspace.name:match("special:special") then
                hl.dispatch(hl.dsp.workspace.toggle_special("special"))
            else
                hl.dispatch(hl.dsp.workspace.toggle_special("music"))
            end
        else 
            hl.dispatch(hl.dsp.workspace.toggle_special("music"))
        end
    end
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


hl.gesture({
    fingers = VgestureFingersMore,
    direction = "horizontal",
    action = {
        start = function(dataTable) hl.notification.create({text = "start: delta.y: " .. dataTable.delta.y, duration = 3000}) end,
        update = function(dataTable) hl.notification.create({text = "start: delta.y: " .. dataTable.delta.y, duration = 3000}) end,
    }
})