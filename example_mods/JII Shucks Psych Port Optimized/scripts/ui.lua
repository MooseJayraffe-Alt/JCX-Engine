local shadow = true
local noteData = 'noteSkins/default'
local noteData2 = 'noteSkins/shadow'
local camInt = 1
local nameZoom = false

function onStartCountdown()
setProperty('skipCountdown', true)
end

function onSongStart()
setProperty('camGame.visible', true)
setProperty('camHUD.visible', true)
setProperty('camOther.visible', true)
end

function onCreatePost()
setProperty('camGame.visible', false)
setProperty('camHUD.visible', false)
setProperty('camOther.visible', false)

for i = 0, 3 do
 setPropertyFromGroup('playerStrums', i, 'useRGBShader', false)
setPropertyFromGroup('opponentStrums', i, 'useRGBShader', false)
end

for i = 0, getProperty('unspawnNotes.length') - 1 do
setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
end

makeLuaSprite('iridaBar','bars/default',0, 580)
setObjectCamera('iridaBar','hud')
addLuaSprite('iridaBar')
screenCenter('iridaBar','x')
setObjectOrder('iridaBar', 999)

makeLuaSprite('iconP3','icons/rose-shucks',920 + 300,600)
setObjectCamera('iconP3','hud')
scaleObject('iconP3',0.85,0.85)
setProperty('iconP3.flipX', true)
addLuaSprite('iconP3')
setProperty('iconP3._frame.frame.width', 150)

setProperty('healthBar.y',640)
setProperty('healthBar.x',-31)
scaleObject('healthBar',1.25,1)

setObjectOrder('iconP1', 9999)
setObjectOrder('iconP2', 9999)
setObjectOrder('iconP3', 9999)
setObjectOrder('scoreTxt', 9999)

setTextFont('scoreTxt','SuperMario256.ttf')
setProperty('iridaBar.y',580 + 200)
setProperty('healthBar.y',640 + 200)
setProperty('scoreTxt.y',680 + 200)
setProperty('iconP1.y', 565 + 200)
setProperty('iconP2.y', 565 + 200)
setProperty('iconP3.y', 600 + 200)
setProperty('healthBar.bg.visible',false)

if songName == 'shucks' then
loadGraphic('iridaBar','bars/shadow')
shadow = true
end
end

function onUpdate()
end

function onUpdatePost(elapsed)
setProperty('iconP1.x', 975)
setProperty('iconP2.x', 150)

if shadow then
noteData = 'noteSkins/shadow'
else
noteData = 'noteSkins/default'
end
end

function onEvent(name,v1,v2)
if name == "Change Camera Bop" then
local newIntensity = tonumber(v1)
nameZoom = true
if newIntensity then
camInt = newIntensity
end
end
if name == 'Camera Position' then
triggerEvent('Camera Follow Pos', v1, v2)
triggerEvent('Camera Zoom', '0.45', '2')
if v1 == '' then
triggerEvent('Camera Follow Pos', '', '')
triggerEvent('Camera Zoom', '0.55', '2')
end
end

if name == 'Scroll Speed Change' then
setProperty('songSpeed', v1)
end

if name == 'Change Stage' then

end

if name == 'Camera Zoom' then
cancelTween('tag')
doTweenZoom('tag', 'camGame', v1, v2, 'cubeOut')
setProperty('defaultCamZoom', v1)
end

if name == 'defaultHUD' then
shadow = false
loadGraphic('iridaBar','bars/default')
end

if name == 'showHUD' then
if v1 == 'up' then
doTweenY('iridaBar','iridaBar',580,1,'quadOut')
doTweenY('healthBar','healthBar',640, 1,'quadOut')
doTweenY('scoreTxt','scoreTxt',680,1,'quadOut')
doTweenY('iconP1','iconP1',565,1,'quadOut')
doTweenY('iconP2','iconP2',565,1,'quadOut')
doTweenY('iconP3','iconP3',600,1,'quadOut')
end
if v1 == 'down' then
doTweenY('iridaBar2','iridaBar',580 + 200,1,'quadOut')
doTweenY('healthBar2','healthBar',640 + 200, 1,'quadOut')
doTweenY('scoreTxt2','scoreTxt',680 + 200,1,'quadOut')
doTweenY('iconP12','iconP1',565 + 200,1,'quadOut')
doTweenY('iconP22','iconP2',565 + 200,1,'quadOut')
doTweenY('iconP32','iconP3',600 + 200,1,'quadOut')
end
end
end

function onBeatHit()
setProperty('iconP3.scale.x', 1.05)
setProperty('iconP3.scale.y', 1.05)
doTweenX('iconP3BackX', 'iconP3.scale', 0.85, 0.2, 'circOut')
doTweenY('iconP3BackY', 'iconP3.scale', 0.85, 0.2, 'circOut')
if nameZoom then
if camInt > 0 then
triggerEvent('Add Camera Zoom', tostring(0.015 * camInt), tostring(0.03 * camInt))
end
end
end