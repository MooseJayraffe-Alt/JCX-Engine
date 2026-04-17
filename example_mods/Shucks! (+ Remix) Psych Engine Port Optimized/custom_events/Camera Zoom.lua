local pera = 0

function onEvent(n,v1,v2)
if n == "Camera Zoom" then
local instant = v1 or true
--kay
splitV2 = stringSplit(v2, ',')
tweenCameraZoom(splitV2[1], splitV2[3], splitV2[4], splitV2[5], splitV2[6])
end
end

function tweenCameraZoom(zoom, duration, ease, ease2,mode)
local stageZoom = callMethodFromClass('backend.StageData', 'getStageFile', {curStage}).defaultZoom
local targetZoom = tonumber(zoom) * (direct and getProperty('defaultCamZoom') or stageZoom)
--zoom mode	
if mode == nil then
mode = 'direct'
end
if ease == nil then
ease = 'linear'
end
if ease2 == nil then
ease2 = ''
end
--cancela o anterior	
cancelTween('zoomEventTween')
--tween
if mode == 'stage' then
startTween('zoomEventTween', 'game', {defaultCamZoom = targetZoom}, runHaxeCode([[(Conductor.stepCrochet / 1000)]]) * duration, {ease = tostring(ease..ease2)})
elseif mode == 'direct' then
doTweenZoom('zoomEventTween', 'camGame', zoom, runHaxeCode([[(Conductor.stepCrochet / 1000)]]) * duration, tostring(ease..ease2))
setProperty('defaultCamZoom', zoom)
end
coiso = tostring(mode)
end

function camZoomInstantLol(zoom)
runHaxeCode([[
game.defaultCamZoom = ]]..zoom..[[;
FlxG.camera.zoom = ]]..zoom..[[;
]])
end