---Needed to get the colors out of the old scheme
local M = {}

function M.is_app_open(target_class)
    for _, win in ipairs(hl.get_windows()) do
        if win.class == target_class then
            return true
        end
    end
    return false
end

function M.parse_hypr_conf(path)
    local vars = {}
    if path:sub(1, 1) == "~" then
        path = os.getenv("HOME") .. path:sub(2)
    end
    
    local file = io.open(path, "r")
    if not file then 
        return vars 
    end
    
    for line in file:lines() do
        -- line = line:gsub("#.*", "")
        local name, value = line:match("^%s*%$([%w_]+)%s*=%s*(.-)%s*$")
        if name and value then
            vars[name] = value
        end
    end
    file:close()
    return vars
end

-- Hyprland has only one animation style for all special workspaces, so we
-- set it right before each toggle. In "slidefadevert X%" the sign of X sets
-- the direction: negative = slides in from the top, positive = from the bottom.
local special_anim_direction = {
    music = "50%", -- from the bottom
}
local special_anim_default = "-50%" -- from the top (matches animations.lua)

function M.toggle_special(name)
    hl.animation({
        leaf = "specialWorkspace", enabled = true, speed = 4, bezier = "specialWorkSwitch",
        style = "slidefadevert " .. (special_anim_direction[name] or special_anim_default)
    })
    hl.dispatch(hl.dsp.workspace.toggle_special(name))
end

return M
