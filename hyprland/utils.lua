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

return M
