local camBopRate = 4
local camBopIntensity = 0

function onEvent(name, value1, value2)
    if name == 'Camera Modulo Change' then
        -- Converte valores e evita erros com tonumber falhando
        splitV2 = stringSplit(value2, ',')
        camBopRate = tonumber(value1) or 1
        camBopIntensity = tonumber(splitV2[1]) or 0        
    end
end

function onBeatHit()
    if curBeat % camBopRate == 0 then
    setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.015 * camBopIntensity)
    setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.03 * camBopIntensity)
    end
end

function onSongStart()
setProperty('camZooming', true)
end

function onUpdate()
setProperty('camZoomingMult', 0)
end