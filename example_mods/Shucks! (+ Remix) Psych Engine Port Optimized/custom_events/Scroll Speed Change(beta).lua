function stringSplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

function onCreate()
makeLuaSprite("noteSpeedShit", nil, 0,0)  
setProperty("noteSpeedShit.alpha", 0)
addLuaSprite('noteSpeedShit', false)  
end

local noteSpeed = 1

function onUpdate(elapsed)
noteSpeed = getProperty('noteSpeedShit.x')
--uh
if per then
for i = 0, getProperty('unspawnNotes.length') - 1 do      
setPropertyFromGroup('unspawnNotes', i, 'multSpeed', noteSpeed)
end
end
end

--Change Scroll Speed

function onEvent(name, value1, value2)
    if name == 'Scroll Speed Change' then
        
        local tween = value1      
        local duration = 0
        local ease = 'linear'

        --if value2 ~= '' then
            local split = stringSplit(value2, ',')
            local target = tonumber(split[1]) or 1
            duration = tonumber(split[2]) or 0
            ease = split[3] or 'linear'
            ease2 = split[4] or 'In'
        --end
        
        per = true
        
        if not tween then
       doTweenX('speedTween', 'noteSpeedShit', 1 + target, duration, ease..ease2)
        else
        setProperty('scrollSpeed.x', 10 + target)
        --setProperty('scrollSpeed', target)
        end
    end
end