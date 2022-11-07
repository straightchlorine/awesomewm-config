local notifier = require("helpers.notifier")
local prevTag = nil

function logTime()
    local path = os.getenv("HOME") .. "/.cache/awesome/activity.log"
    local file, err = io.open(path, "a")
   
    if file then
        local date = os.date("%M%S")
        file:write(date .. "\n")
        
        local size = file:seek("end")
        if size >= 4000 then
            io.open(path, "w"):close()
        end

        file:close()
    else
        print("couldn't open  the file: " .. err)
    end

end

function logTag(n, tagid, screenid)
    local naughty = require("naughty")
    local path = os.getenv("HOME") .. "/.cache/awesome/tag.log"
    local file, err = io.open(path, "a")

    if file then
        local t = tagid - 1

        if screenid > 1 then
            t = t + ((screenid - 1) * n)
        end

        file:write(t .. "\n")
        prevTag = t 

        local size = file:seek("end")
        if size >= 4000 then
            io.open(path, "w"):close()
        end

        file:close()
    else
        print("couldn't open the file: " .. err)
    end

end

function logPrevTag(n, screenid)
    local naughty = require("naughty")
    local path = os.getenv("HOME") .. "/.cache/awesome/tag.log"
    local file, err = io.open(path, "a")

    if file then
        file:write(prevTag .. "\n")

        local size = file:seek("end")
        if size >= 4000 then
            io.open(path, "w"):close()
        end

        file:close()
    else
        print("couldn't open the file: " .. err)
    end

end


-- extracting tag and screen without ugly snippets
function extractAndLogFromClient(clientref)
    local t = clientref.focus and client.focus.first_tag or nil
    local s = clientref.screen
    
    if t == nil then
        t = s.selected_tag
    end
    
    local tagid = t.index
    local screenid = s.index
    
    logTag(4, tagid, screenid)
end

function extractAndLogFromTag(tagref)
    local tagid = tagref.index
    local screenid = tagref.screen.index
    logTag(4, tagid, screenid)
end

function extractAndLogFromScreen(screenref)
    local tag = screenref.selected_tag
    local screen = screenref.index
    logTag(4, tagid, screenid)
end

function extractAndLog()
    local awful = require("awful")
    local screenid = awful.screen.focused().index
    local tagid = awful.screen.focused().selected_tag
    
    if screenid ~= nil and tagid ~= nil then
        logTag(4, tagid, screenid)
    end
end
