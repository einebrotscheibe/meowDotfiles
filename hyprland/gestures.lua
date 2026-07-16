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

-- to add: brightness and volume