function onEvent(name, value1, value2)
if name == 'Camera Position' then

    local params = stringSplit(value2, ',')

    local targetX = tonumber(value1)
    local targetY = tonumber(params[1])

    local Instant = true
    if params[2] ~= nil then
        Instant = params[2] == 'true'
    end

    local durationMult = tonumber(params[3]) or 1
    local tweenType = (params[4] or 'linear'):lower()
    local tweenType2 = (params[5] or 'In'):lower()

    local duration = (stepCrochet/1000) * durationMult

    if Instant == false then
        setProperty('camFollow.x', targetX)
        setProperty('camFollow.y', targetY)

        runHaxeCode([[
            FlxG.camera.snapToTarget();
        ]])
    else
        doTweenX('camFollowTweenX', 'camFollow', targetX, duration/2, tweenType..tweenType2)
        doTweenY('camFollowTweenY', 'camFollow', targetY, duration/2, tweenType..tweenType2)
    end
end
end