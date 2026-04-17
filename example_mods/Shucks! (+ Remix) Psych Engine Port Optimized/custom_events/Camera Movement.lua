-- Função para dividir strings (já que stringSplit não é nativa)
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
-- Função auxiliar para pegar a posição da câmera de um personagem
function getCharacterCameraPosition(char)
    if char == 'boyfriend' then
    x = getMidpointX('boyfriend') - 100 - getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
    y = getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]')
    elseif char == 'dad' then
    x = getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
    y = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')
    elseif char == 'gf' then
    x = getMidpointX('gf') + getProperty('gf.cameraPosition[0]') + getProperty('girlfriendCameraOffset[0]')
    y = getMidpointY('gf') + getProperty('gf.cameraPosition[1]') + getProperty('girlfriendCameraOffset[1]')
    end
    return x, y
end

function onEvent(name, value1, value2)
    if name == 'Camera Movement' then
        -- value1: target,offsetX,offsetY,duration,tweenType
        local params = stringSplit(value2, ',')

        local target = value1 or '1'
        --local offsetX = tonumber(params[2]) or 0
        --local offsetY = tonumber(params[3]) or 0
        local tween = params[1]
        local durationMult = tonumber(params[2]) or 1
        local tweenType = (params[3] or 'linear'):lower()
        local tweenType2 = (params[4] or 'In'):lower()

        --local duration = ((stepCrochet / 8) / 1000) * durationMult
        local duration = (stepCrochet/1000) * durationMult

        local charName = ''
        if target == '0' then
            charName = 'dad'
        elseif target == '1' then
            charName = 'boyfriend'
        elseif target == '2' then
            charName = 'gf'
        else
            return -- se o target não for válido
        end

        local targetX, targetY = getCharacterCameraPosition(charName)
        --targetX = targetX + offsetX
        --targetY = targetY + offsetY

        -- Cancela tweens antigos se existirem
        cancelTween('camFollowTweenX')
        cancelTween('camFollowTweenY')

        if string.find(value2, 'INSTANT') then
            instant = true
            else
            instant = false
        end
        
        if value2 ~= '' then
        tween = false
        else
        tween = true
        end
        
        if tween then          
            doTweenX('camFollowTweenX', 'camFollow', targetX, duration/2, tweenType)
            doTweenY('camFollowTweenY', 'camFollow', targetY, duration/2, tweenType)
        if instant then
            runHaxeCode([[
            FlxG.camera.snapToTarget();
        ]])
        end
        else
            setProperty('camFollow.x', targetX)
            setProperty('camFollow.y', targetY)
        if instant then
            runHaxeCode([[
            FlxG.camera.snapToTarget();
        ]])
        end
        end
  end
end

function onUpdatePost()
setProperty('isCameraOnForcedPos', true)
end