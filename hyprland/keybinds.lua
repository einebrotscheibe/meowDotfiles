--- Apps
hl.bind(VkbTerminal, hl.dsp.exec_cmd(Vterminal))
hl.bind(VkbBrowser, hl.dsp.exec_cmd(Vbrowser))
hl.bind(VkbCodeEditor, hl.dsp.exec_cmd(VcodeEditor))
hl.bind(VkbMDEditor, hl.dsp.exec_cmd(VMDEditor))
hl.bind(VkbFileExplorer, hl.dsp.exec_cmd("foot " .. VfileExplorer))
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("nautilus"))


--- Utilities
hl.bind("Print", hl.dsp.exec_cmd("caelestia screenshot"), {locked = true})
hl.bind("SUPER + SHIFT + S", hl.dsp.global("caelestia:screenshotFreeze"), {})
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("caelestia record"), {}) -- record sccreen
hl.bind("SUPER + SHIFT + CTRL + R", hl.dsp.exec_cmd("caelestia record -s"), {}) --record with sound
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"), {}) --color picker


--- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), {locked = true, repeating = true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {locked = true, repeating = true})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {locked = true})


--- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.global("caelestia:brightnessUp"), {locked = true})
hl.bind("XF86MonBrightnessDown", hl.dsp.global("caelestia:brightnessDown"), {locked = true})


--- Media
hl.bind(VkbMediaToggle, hl.dsp.global("caelestia:mediaToggle"), {locked = true})
hl.bind("XF86AudioPlay", hl.dsp.global("caelestia:mediaToggle"), {locked = true})
hl.bind("XF86AudioNext", hl.dsp.global("caelestia:mediaNext"), {locked = true})
hl.bind("XF86AudioPrev", hl.dsp.global("caelestia:mediaPrev"), {locked = true})


--- Lock
hl.bind(VkbLock, hl.dsp.global("caelestia:lock"), {})
hl.bind(VkbSleep, hl.dsp.exec_cmd("systemctl suspend-then-hibernate"), {locked = true})


--- Clipboard and emoji picker
hl.bind(VkbClipboard, hl.dsp.exec_cmd("pkill fuzzel || caelestia clipboard"))
hl.bind(VkbClipboardDelete, hl.dsp.exec_cmd("pkill fuzzel || caelestia clipboard -d"))
hl.bind(VkbEmoji, hl.dsp.exec_cmd("pkill fuzzel || caelestia emoji -p"))


--- Misc
hl.bind(VkbSession, hl.dsp.global("caelestia:session"), {locked = true})
hl.bind(VkbClearNotifs, hl.dsp.global("caelestia:clearNotifs"), {locked = true})
hl.bind(VkbShowPanels, hl.dsp.global("caelestia:showall"), {})


--- Kill/restart
hl.bind("CTRL + SUPER + ALT + R", hl.dsp.exec_cmd("qs -c caelestia kill; sleep .1; caelestia shell -d"), {release = true})


--- Workspace actions
-- go to and move to workspace # 
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(VkbGoToWs .. " + " .. key, hl.dsp.focus({workspace = i}))
    hl.bind(VkbMoveWinToWs .. " + " .. key, hl.dsp.window.move({workspace = i}))
end

-- Go to workspace -1/+1
hl.bind(VkbNextPrevWs .. " + mouse_down", hl.dsp.focus({workspace = "r+1"}), {repeating = true})
hl.bind(VkbNextPrevWs .. " + mouse_up", hl.dsp.focus({workspace = "r-1"}), {repeating = true})
hl.bind(VkbNextPrevWs .. " + right", hl.dsp.focus({workspace = "r+1"}), {repeating = true})
hl.bind(VkbNextPrevWs .. " + left", hl.dsp.focus({workspace = "r-1"}), {repeating = true})

-- Move window to workspace -1/+1
hl.bind(VkbMoveWinToNextPrevWs .. " + mouse_down", hl.dsp.window.move({workspace = "r+1"}), {repeating = true})
hl.bind(VkbMoveWinToNextPrevWs .. " + mouse_up", hl.dsp.window.move({workspace = "r-1"}), {repeating = true})
hl.bind(VkbMoveWinToNextPrevWs .. " + right", hl.dsp.window.move({workspace = "r+1"}), {repeating = true})
hl.bind(VkbMoveWinToNextPrevWs .. " + left", hl.dsp.window.move({workspace = "r-1"}), {repeating = true})


--- Window actions
-- focus next window
hl.bind(VkbCycleNext, hl.dsp.window.cycle_next())

-- move windows
for _,direction in ipairs({"left", "right", "up", "down"}) do
    hl.bind(VkbMoveWindowArrows .. " + " .. direction, hl.dsp.window.move({direction = direction}))
end

-- resize windows
do 
    local resizeAmount = 50
    hl.bind(VkbResizeWindowArrows .. " + Right", hl.dsp.window.resize({x = resizeAmount, y = 0, relative = true}), {repeating = true})
    hl.bind(VkbResizeWindowArrows .. " + Left",  hl.dsp.window.resize({x = -resizeAmount, y = 0, relative = true}), {repeating = true})
    hl.bind(VkbResizeWindowArrows .. " + Up",    hl.dsp.window.resize({x = 0, y = -resizeAmount, relative = true}), {repeating = true})
    hl.bind(VkbResizeWindowArrows .. " + Down",  hl.dsp.window.resize({x = 0, y = resizeAmount, relative = true}), {repeating = true})
end

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), {mouse = true})
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), {mouse = true})
hl.bind(VkbMoveWindow, hl.dsp.window.drag(), {mouse = true})
hl.bind(VkbResizeWindow, hl.dsp.window.resize(), {mouse = true})


-- toggle fullscreen
hl.bind(VkbWindowFullscreen, hl.dsp.window.fullscreen({mode = "fullscreen", action = "toggle"}))
hl.bind(VkbWindowBorderedFullscreen, hl.dsp.window.fullscreen({mode = "maximized", action = "toggle"}))

-- toggle floating
hl.bind(VkbToggleWindowFloating, hl.dsp.window.float({action = "toggle"}))

-- close window
hl.bind(VkbCloseWindow, hl.dsp.window.close())


--- Special Workspaces
-- Toggle special workspaces
hl.bind(VkbToggleScratchpadWs, hl.dsp.workspace.toggle_special("special"), {})

-- Toggle move window to scratchpad workspace
hl.bind(VkbMoveToggleSpecialWs, function()
    local win = hl.get_active_window()
    if not win then return end

    -- special wordplace if id < 0
    if win.workspace and win.workspace.id < 0 then
        hl.dispatch(hl.dsp.window.move({workspace = "r+0"}))
    else
        -- if normal window, move it to special workspace
        hl.dispatch(hl.dsp.window.move({workspace = "special"}))
    end
end)

-- load utils module
local config_dir = os.getenv("HOME") .. "/.config/hypr/hyprland/"
local utils = dofile(config_dir .. "utils.lua")
-- sysmon workspace
hl.bind(VkbSystemMonitor, function()
    if not utils.is_app_open("btop-sysmon") then
        hl.dispatch(hl.dsp.exec_cmd("foot -a btop-sysmon btop"))
    else
        hl.dispatch(hl.dsp.workspace.toggle_special("sysmon"))
    end
end, {})

-- music workspace
hl.bind(VkbMusicSpotify, function()
    if not utils.is_app_open("spotify") then
        hl.dispatch(hl.dsp.exec_cmd("spotify"))
    else
        hl.dispatch(hl.dsp.workspace.toggle_special("music"), {})
    end
end, {})

-- communication workspace
hl.bind(VkbCommunication, hl.dsp.workspace.toggle_special("communication"), {})


--- Launcher
hl.bind("SUPER + SUPER_L", hl.dsp.global("caelestia:launcher"), {release = true , ignore_mods = true})
hl.bind("SUPER", hl.dsp.global("caelestia:launcherInterrupt"), {catchall = true, ignore_mods = true, non_consuming = true})
hl.bind("SUPER + mouse:272", hl.dsp.global("caelestia:launcherInterrupt"), {ignore_mods = true, non_consuming = true})
hl.bind("SUPER + mouse:273", hl.dsp.global("caelestia:launcherInterrupt"), {ignore_mods = true, non_consuming = true})
hl.bind("SUPER + mouse:274", hl.dsp.global("caelestia:launcherInterrupt"), {ignore_mods = true, non_consuming = true})
hl.bind("SUPER + mouse:275", hl.dsp.global("caelestia:launcherInterrupt"), {ignore_mods = true, non_consuming = true})
hl.bind("SUPER + mouse:276", hl.dsp.global("caelestia:launcherInterrupt"), {ignore_mods = true, non_consuming = true})
hl.bind("SUPER + mouse:277", hl.dsp.global("caelestia:launcherInterrupt"), {ignore_mods = true, non_consuming = true})
hl.bind("SUPER + mouse_up", hl.dsp.global("caelestia:launcherInterrupt"), {ignore_mods = true, non_consuming = true})
hl.bind("SUPER + mouse_down", hl.dsp.global("caelestia:launcherInterrupt"), {ignore_mods = true, non_consuming = true})


-- Screen Idle
hl.bind("SUPER + SHIFT + CTRL + L", function()
    hl.timer(function()
        hl.dispatch(hl.dsp.dpms({ action = "off" }))
    end, { timeout = 500, type = "oneshot" })
end)


--- Testing
do 
    local testCommand = [=[notify-send -u low -i dialog-information-symbolic 'Test notification' "Here's a really long message to test truncation and wrapping\nYou can middle click or flick this notification to dismiss it!" -a 'Shell' -A "Test1=I got it!" -A "Test2=Another action"]=]
    hl.bind("SUPER + ALT + F12", hl.dsp.exec_cmd(testCommand))
end
