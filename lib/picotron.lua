-- https://www.lexaloffle.com/bbs/?tid=140784
function require_lua(name)
    if _modules == nil then
        _modules={}
    end
 
    local already_imported = _modules[name]
    if already_imported ~= nil then
        return already_imported
    end
 
    local filename = fullpath(name..'.lua')
    local src = fetch(filename) 
 
    if (type(src) ~= "string") then 
        notify("could not include "..filename)
        stop()
        return
    end 
 
    -- https://www.lua.org/manual/5.4/manual.html#pdf-load
    -- chunk name (for error reporting), mode ("t" for text only -- no binary chunk loading), _ENV upvalue
    -- @ is a special character that tells debugger the string is a filename
    local func,err = load(src, "@"..filename, "t", _ENV)
    -- syntax error while loading
    if (not func) then 
        -- printh("** syntax error in "..filename..": "..tostr(err))
        --notify("syntax error in "..filename.."\n"..tostr(err))
        send_message(3, {event="report_error", content = "*syntax error"})
        send_message(3, {event="report_error", content = tostr(err)})
 
        stop()
        return
    end
 
    local module = func()
    _modules[name]=module

    return module
end

function pow(x,a)
  return x ^ a
end

function xpcall_lua(fn, err)
    --[[local function fn_err(...)
        return err(debug.traceback(...))
    end
    return pcall(fn_err)--]]
    -- TODO: actually do error stuff.
    fn()
    return true
end

function tableMerge(t1, t2)
    for k,v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                tableMerge(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

--[[_G = {
    require = require,
    xpcall = xpcall_lua,
    rawset = rawset,
    type = type,
    math = math,
    tostring = tostring,
    table = table
}]]--

-- mmm i sure love messing with varibles i probably shouldnt be!
_G = tableMerge(_G, {
    xpcall = xpcall_lua,
    require = require_lua
})

_G.math.pow = pow

package = {
    loaded = {

    }
}