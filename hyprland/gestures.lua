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
    fingers = VworkspaceSwipeFingers,
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
    fingers = VworkspaceSwipeFingers,
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
-- to add: brightness and volume