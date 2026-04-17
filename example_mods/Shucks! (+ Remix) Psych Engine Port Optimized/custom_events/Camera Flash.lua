function onEvent(name, value1, value2)
    if name == 'Camera Flash' then
        -- Define valores padrão
        local cor = split(value2, ',')[1] or 'FFFFFF'
        local duration = tonumber(split(value2, ',')[2]) or 8
        local camera = split(value2, ',')[3] or 'camHUD'

        -- Cor branca
        cameraFlash(camera, cor, runHaxeCode([[(Conductor.stepCrochet / 1000)]]) * duration, true)
    end
end

-- Função auxiliar para dividir strings por vírgula
function split(str, delimiter)
local result = {}
for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
table.insert(result, match)
end
return result
end